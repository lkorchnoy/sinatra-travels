class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :name 
      t.string :description 
      t.string :recommendation
      t.integer :distance 
      t.integer :user_id 
    end
  end
end
