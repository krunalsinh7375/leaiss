class CreateCdrs < ActiveRecord::Migration
  def change
    create_table :cdrs do |t|
      t.integer :user_id
      t.string :mobile_no, :limit => 12
      t.string :name, :limit => 50
      t.string :case_no, :limit => 25

      t.timestamps
    end
  end
end
