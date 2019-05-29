class CreateExcuses < ActiveRecord::Migration[5.2]
  def change
    create_table :excuses do |t|
      t.integer used_id
      t.integer trip_id
      t.string message
  end
end
