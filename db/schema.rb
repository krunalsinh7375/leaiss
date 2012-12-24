# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221194845) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip_address"
    t.datetime "time_stamp"
    t.string   "name"
    t.string   "browser_info"
    t.string   "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cdr_records", :force => true do |t|
    t.integer  "cdr_id"
    t.datetime "call_date"
    t.string   "call_type",      :limit => 20
    t.integer  "duration"
    t.string   "calling_number", :limit => 40
    t.string   "called_number",  :limit => 40
    t.string   "imei",           :limit => 20
    t.string   "first_cell_id",  :limit => 16
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "cdrs", :force => true do |t|
    t.integer  "user_id"
    t.string   "mobile_no",  :limit => 12
    t.string   "name",       :limit => 50
    t.string   "case_no",    :limit => 25
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "cell_towers", :force => true do |t|
    t.string   "cell_id"
    t.string   "lac"
    t.string   "cgi"
    t.string   "address"
    t.date     "latitude"
    t.string   "longitude"
    t.string   "tower_type"
    t.string   "company"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rtos", :force => true do |t|
    t.string "mv_no",         :limit => 20
    t.string "year",          :limit => 5
    t.string "owner_name",    :limit => 80
    t.string "owner_address", :limit => 200
    t.string "city",          :limit => 15
    t.string "chasis_no",     :limit => 45
    t.string "engine_no",     :limit => 45
    t.string "model_des",     :limit => 45
    t.string "color",         :limit => 45
  end

  create_table "sdrs", :force => true do |t|
    t.string   "name"
    t.string   "mobile_number"
    t.string   "address"
    t.date     "activation_date"
    t.string   "sp"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "phone"
    t.string   "designation"
    t.string   "city"
    t.string   "branch"
    t.boolean  "admin",           :default => false
    t.string   "secondary_email"
    t.string   "badge_num"
    t.date     "dob"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
