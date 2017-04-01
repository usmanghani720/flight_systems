class AddColumnsToSavedSearches < ActiveRecord::Migration
  def change
    add_column :saved_searches, :passenger_type, :string
    add_column :saved_searches, :passenger_count, :string
  end
end
