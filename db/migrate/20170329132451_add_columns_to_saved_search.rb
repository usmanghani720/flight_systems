class AddColumnsToSavedSearch < ActiveRecord::Migration
  def change
    add_column :saved_searches, :adult_count, :integer
    add_column :saved_searches, :children_count, :integer
    add_column :saved_searches, :infants_on_seat_count, :integer
    add_column :saved_searches, :infants_in_lap_count, :integer
    add_column :saved_searches, :total_passenger_count, :integer
  end
end
