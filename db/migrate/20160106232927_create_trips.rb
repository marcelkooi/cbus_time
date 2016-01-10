class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :commute
    	t.datetime :start_time
    	t.string :start_location
    	t.datetime :end_time
    	t.string :end_location
    	t.text :notes

      t.timestamps null: false
    end
  end
end
