class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name 
      t.string :description 
      t.integer :travel_id
    end 
  end
end
