class AddApiHitTimeToSavedSearches < ActiveRecord::Migration
  def change
    add_column :saved_searches, :api_hit_time, :datetime
  end
end
