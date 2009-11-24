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

ActiveRecord::Schema.define(:version => 20091124024317) do

  create_table "events", :force => true do |t|
    t.integer  "country",                     :default => 0,     :null => false
    t.integer  "ministry",                    :default => 0,     :null => false
    t.string   "name",         :limit => 128,                    :null => false
    t.string   "desc_brief",   :limit => 128,                    :null => false
    t.text     "desc_detail",                                    :null => false
    t.datetime "start",                                          :null => false
    t.datetime "end",                                            :null => false
    t.datetime "reg_start",                                      :null => false
    t.datetime "reg_end",                                        :null => false
    t.string   "website",      :limit => 128,                    :null => false
    t.text     "email_text",                                     :null => false
    t.float    "price",                       :default => 0.0,   :null => false
    t.float    "deposit",                     :default => 0.0,   :null => false
    t.text     "email",                                          :null => false
    t.text     "price_text",                                     :null => false
    t.boolean  "on_home_page",                :default => true,  :null => false
    t.boolean  "allow_cash",                  :default => false, :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "event",                     :default => 0,   :null => false
    t.integer  "person",                    :default => 0,   :null => false
    t.datetime "date",                                       :null => false
    t.string   "confirm_num", :limit => 64,                  :null => false
    t.integer  "status",                    :default => 0,   :null => false
    t.float    "balance",                   :default => 0.0, :null => false
  end

end
