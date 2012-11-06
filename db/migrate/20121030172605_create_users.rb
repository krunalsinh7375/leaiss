class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :name
      t.string :phone
      t.string :designation
      t.string :city
      t.string :branch
      t.boolean :admin, :default => 0
      t.string :secondary_email
      t.string :badge_num
      t.date   :dob

      t.timestamps
    end
  end
end
