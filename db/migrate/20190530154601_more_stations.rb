class MoreStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :commonName
      t.string :icsCode
    end
  end
end