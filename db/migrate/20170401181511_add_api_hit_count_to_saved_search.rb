class AddApiHitCountToSavedSearch < ActiveRecord::Migration
  def change
    add_column :saved_searches, :api_hit_count, :integer
  end
end
