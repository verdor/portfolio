require 'net/http'
require 'open-uri'
require 'json'

class Location
	attr_reader :latitude, :longitude

	def initialize(latitude, longitude)
		@latitude 	= latitude
		@longitude 	= longitude
		# @map_url		= map_url
    # @location   = location
	end

	# http://maps.googleapis.com/
	def map_url
		# "https://api.opencagedata.com/staticmap.php?center=#{@latitude},#{@longitude}&zoom=14&size=400x300&maptype=mapnik&key=55f3c34bb9a3424d96a72154deca11ea"
    # "http://maps.google.com/maps/api/staticmap?center=#{@latitude},#{@longitude}&zoom=2&size=400x300&markers=#{@latitude},#{@longitude}&key=AIzaSyAh1tBFgvSyKSXg7igNv-ajDRLeRs2qdXU"
		# "http://maps.google.com/maps/api/staticmap?size=400x200&sensor=false&zoom=16&markers=#{@latitude}%2C#{@longitude}"
		"https://staticmap.openstreetmap.de/staticmap.php?center=#{@latitude},#{@longitude}&zoom=14&size=400x300&maptype=mapnik"
		# "https://api.opencagedata.com/staticmap.php?center=#{@latitude},#{@longitude}&zoom=14&size=400x300&maptype=mapnik&key=55f3c34bb9a3424d96a72154deca11ea"
	end

	# https://opencagedata.com/api
  def location
    url = "https://api.opencagedata.com/geocode/v1/json?q=#{@latitude}+#{@longitude}&key=55f3c34bb9a3424d96a72154deca11ea"
    data = URI.parse(url).read
    json_data = JSON.parse(data)
    if json_data['results'].present?
      json_data['results'][0]["formatted"]
    end
	end
end
