# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120914045623) do

  create_table "event_series", :force => true do |t|
    t.integer  "frequency",    :default => 1
    t.string   "period",       :default => "monthly"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_room"
    t.datetime "until"
    t.integer  "user_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "all_day",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "event_series_id"
    t.integer  "meeting_room"
    t.datetime "until"
    t.integer  "user_id"
  end

  add_index "events", ["event_series_id"], :name => "index_events_on_event_series_id"

  create_table "meetingrooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "department"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "active",                 :default => false, :null => false
  end

end
