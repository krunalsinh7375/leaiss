class CreateSdrs < ActiveRecord::Migration
  def change
    create_table :sdrs do |t|
      t.string :name
      t.string :mobile_number
      t.string :address
      t.date :activation_date
      t.string :sp

      t.timestamps
    end
  end
end
