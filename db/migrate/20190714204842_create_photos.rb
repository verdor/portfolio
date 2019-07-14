class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.boolean :favourite
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
