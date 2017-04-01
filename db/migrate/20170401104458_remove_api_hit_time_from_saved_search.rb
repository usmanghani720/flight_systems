class RemoveApiHitTimeFromSavedSearch < ActiveRecord::Migration
  def change
    remove_column :saved_searches, :api_hit_time, :datetime
  end
end
