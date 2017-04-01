class RemovePassengerTypeAndPassengerCountFromSavedSearch < ActiveRecord::Migration
  def change
    remove_column :saved_searches, :passenger_type, :string
    remove_column :saved_searches, :passenger_count, :string
  end
end
