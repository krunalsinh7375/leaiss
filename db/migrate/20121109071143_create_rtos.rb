class CreateRtos < ActiveRecord::Migration
  def change
    create_table :rtos do |t|
      t.string :mv_no
      t.integer :year
      t.string :owner_name
      t.string :owner_address
      t.string :city
      t.string :chasis_no
      t.string :engine_no
      t.string :model_des
      t.string :color

      t.timestamps
    end
  end
end
