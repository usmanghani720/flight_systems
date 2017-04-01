class RemoveFlightDateTimeFromResult < ActiveRecord::Migration
  def change
    remove_column :results, :flight_date_time, :string
  end
end
