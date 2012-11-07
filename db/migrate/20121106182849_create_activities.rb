class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :ip_address
      t.datetime :time_stamp
      t.string :name
      t.string :browser_info
      t.string :content

      t.timestamps
    end
  end
end
