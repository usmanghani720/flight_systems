class AddDepartureTimeToResult < ActiveRecord::Migration
  def change
    add_column :results, :departure_time, :string
  end
end
