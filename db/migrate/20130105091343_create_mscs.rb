class CreateMscs < ActiveRecord::Migration
  def change
    create_table :mscs do |t|
      t.integer :code
      t.string :operator
      t.string :circle

      t.timestamps
    end
  end
end
