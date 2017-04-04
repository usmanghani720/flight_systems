class RemoveColumnFromAirport < ActiveRecord::Migration
  def change
    remove_column :airports, :lon_decimal_float, :string
  end
end
