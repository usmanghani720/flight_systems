class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :icao_code
      t.string :iata_code
      t.string :name
      t.string :city
      t.string :country
      t.integer :lat_deg
      t.integer :lat_min
      t.integer :lat_sec
      t.string :lat_dir
      t.integer :lon_deg
      t.integer :lon_min
      t.integer :lon_sec
      t.string :lon_dir
      t.integer :altitude
      t.float :lat_decimal
      t.string :lon_decimal_float

      t.timestamps null: false
    end
  end
end
