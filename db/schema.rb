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

ActiveRecord::Schema.define(:version => 20091202164504) do

  create_table "assignment_statuses", :force => true do |t|
    t.string "description", :limit => 64, :null => false
  end

  create_table "assignments", :force => true do |t|
    t.integer "person_id", :default => 0, :null => false
    t.integer "campus_id", :default => 0, :null => false
    t.integer "status_id", :default => 0, :null => false
  end

  add_index "assignments", ["campus_id"], :name => "assignments_campus_id_fk"
  add_index "assignments", ["person_id"], :name => "assignments_person_id_fk"
  add_index "assignments", ["status_id"], :name => "assignments_status_id_fk"

  create_table "campuses", :force => true do |t|
    t.string  "description",       :limit => 128, :null => false
    t.string  "short_description", :limit => 50,  :null => false
    t.integer "account_group_id",                 :null => false
    t.integer "region_id",                        :null => false
    t.string  "website",           :limit => 128, :null => false
    t.string  "facebook_group",    :limit => 128, :null => false
    t.string  "gcx_namespace",     :limit => 128, :null => false
    t.integer "province_id"
  end

  create_table "cash_transactions", :force => true do |t|
    t.integer  "registration_id",               :null => false
    t.string   "staff_name",      :limit => 64, :null => false
    t.integer  "received",                      :null => false
    t.float    "amount_paid",                   :null => false
    t.datetime "date",                          :null => false
  end

  add_index "cash_transactions", ["registration_id"], :name => "cash_transactions_registration_id_fk"

  create_table "events", :force => true do |t|
    t.integer  "country_id",                  :default => 0,     :null => false
    t.integer  "ministry_id",                 :default => 0,     :null => false
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

  create_table "genders", :force => true do |t|
    t.string "description", :limit => 50, :null => false
  end

  create_table "people", :force => true do |t|
    t.string  "first_name",        :limit => 50,                 :null => false
    t.string  "last_name",         :limit => 50,                 :null => false
    t.string  "legal_first_name",  :limit => 50,                 :null => false
    t.string  "legal_last_name",   :limit => 50,                 :null => false
    t.string  "phone",             :limit => 50,                 :null => false
    t.string  "email",             :limit => 128,                :null => false
    t.string  "address",           :limit => 128,                :null => false
    t.string  "city",              :limit => 50,                 :null => false
    t.integer "province_id",                      :default => 0, :null => false
    t.string  "postal_code",       :limit => 50,                 :null => false
    t.integer "gender_id",                        :default => 0, :null => false
    t.string  "local_phone",       :limit => 50,                 :null => false
    t.string  "local_address",     :limit => 128,                :null => false
    t.string  "local_city",        :limit => 50,                 :null => false
    t.string  "local_postal_code", :limit => 50,                 :null => false
    t.integer "local_province_id",                :default => 0, :null => false
    t.string  "cell_phone"
    t.date    "local_valid_until"
    t.integer "title_id"
    t.integer "country_id"
    t.integer "local_country_id"
    t.string  "middle_name"
  end

  add_index "people", ["gender_id"], :name => "people_gender_id_fk"

  create_table "registration_statuses", :force => true do |t|
    t.string "description", :limit => 32, :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "event_id",                  :default => 0,   :null => false
    t.integer  "person_id",                 :default => 0,   :null => false
    t.datetime "date",                                       :null => false
    t.string   "confirm_num", :limit => 64,                  :null => false
    t.integer  "status_id",                 :default => 0,   :null => false
    t.float    "balance",                   :default => 0.0, :null => false
  end

  add_index "registrations", ["event_id"], :name => "registrations_event_id_fk"
  add_index "registrations", ["person_id"], :name => "registrations_person_id_fk"
  add_index "registrations", ["status_id"], :name => "registrations_status_id_fk"

  add_foreign_key "assignments", "assignment_statuses", :name => "assignments_status_id_fk", :column => "status_id", :dependent => :delete
  add_foreign_key "assignments", "campuses", :name => "assignments_campus_id_fk", :dependent => :delete
  add_foreign_key "assignments", "people", :name => "assignments_person_id_fk", :dependent => :delete

  add_foreign_key "cash_transactions", "registrations", :name => "cash_transactions_registration_id_fk", :dependent => :delete

  add_foreign_key "people", "genders", :name => "people_gender_id_fk", :dependent => :delete

  add_foreign_key "registrations", "events", :name => "registrations_event_id_fk", :dependent => :delete
  add_foreign_key "registrations", "people", :name => "registrations_person_id_fk", :dependent => :delete
  add_foreign_key "registrations", "registration_statuses", :name => "registrations_status_id_fk", :column => "status_id", :dependent => :delete

end
