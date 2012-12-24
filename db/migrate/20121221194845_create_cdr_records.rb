class CreateCdrRecords < ActiveRecord::Migration
  def change
    create_table :cdr_records do |t|
      t.integer :cdr_id
      t.datetime :call_date
      t.string :call_type, :limit => 20
      t.integer :duration
      t.string :calling_number, :limit => 40
      t.string :called_number, :limit => 40
      t.string :imei, :limit => 20
      t.string :first_cell_id, :limit => 16

      t.timestamps
    end
  end
end
