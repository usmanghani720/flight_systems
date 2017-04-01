class AddArrivalTimeToResult < ActiveRecord::Migration
  def change
    add_column :results, :arrival_time, :string
  end
end
