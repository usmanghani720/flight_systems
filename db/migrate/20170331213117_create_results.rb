class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :flight_date_time
      t.string :flight_cost

      t.timestamps null: false
    end
  end
end
