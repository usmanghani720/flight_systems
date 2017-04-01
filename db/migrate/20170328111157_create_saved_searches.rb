class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.string :date1
      t.string :date2
      t.string :start
      t.string :end
      t.string :price_max
      t.string :price_min
      t.string :duration
      t.string :flight_type
      t.string :flight_class

      t.timestamps null: false
    end
  end
end
