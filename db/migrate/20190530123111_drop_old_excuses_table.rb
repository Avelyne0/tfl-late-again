class DropOldExcusesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :excuses
  end
end
