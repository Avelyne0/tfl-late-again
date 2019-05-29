class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string origin
      t.string destination
      t.string routes_array
      t.integer user_id 
  end
end
