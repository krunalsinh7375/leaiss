class CreateCellTowers < ActiveRecord::Migration
  def change
    create_table :cell_towers do |t|
      t.string :cell_id
      t.string :lac
      t.string :cgi
      t.string :address
      t.date :latitude
      t.string :longitude
      t.string :tower_type
      t.string :company

      t.timestamps
    end
  end
end
