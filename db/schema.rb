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

ActiveRecord::Schema.define(:version => 20121109071143) do

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

  create_table "rtos", :force => true do |t|
    t.string   "mv_no"
    t.integer  "year"
    t.string   "owner_name"
    t.string   "owner_address"
    t.string   "city"
    t.string   "chasis_no"
    t.string   "engine_no"
    t.string   "model_des"
    t.string   "color"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
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
