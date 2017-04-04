class AddColumnToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :lon_decimal, :float
  end
end
