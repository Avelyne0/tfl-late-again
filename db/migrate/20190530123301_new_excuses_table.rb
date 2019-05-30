class NewExcusesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :excuses do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :message
    end
  end
end
