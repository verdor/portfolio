require 'exifr/jpeg'

module ActiveStorage
  class Analyzer::ImageAnalyzer < Analyzer
    def metadata
      read_image do |image|
        if rotated_image?(image)
          { width: image.height, height: image.width }
        else
          { width: image.width, height: image.height }
        end.merge(data_exif(image) || {})
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end

    private

    def data_exif(image)
      return unless image.type == 'JPEG'

      data = {}
      if (exif = EXIFR::JPEG.new(image.path).exif)
        data[:exif] = exif
        data[:make] = exif.make
        data[:model] = exif.model
        data[:exposure_time] = exif.exposure_time
        data[:iso_speed_ratings] = exif.iso_speed_ratings
        data[:focal_length] = exif.focal_length
        data[:date_time] = exif.date_time
        if (gps = exif.gps)
          data[:latitude]  = gps.latitude
          data[:longitude] = gps.longitude
          data[:altitude]  = gps.altitude
        end
        data
      end
    rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG => e
      logger.info "Malformed JPEG: #{e}"
      {}
    end
  end
end
