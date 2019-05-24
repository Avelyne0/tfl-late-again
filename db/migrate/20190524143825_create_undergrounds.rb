class CreateUndergrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :undergrounds do |t|
      t.string :line
    end
  end
end
