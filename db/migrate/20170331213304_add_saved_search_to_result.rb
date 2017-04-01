class AddSavedSearchToResult < ActiveRecord::Migration
  def change
    add_reference :results, :saved_search, index: true, foreign_key: true
  end
end
