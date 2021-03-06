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

ActiveRecord::Schema.define(:version => 20100113191203) do

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
    t.datetime "updated_at",                    :null => false
  end

  add_index "cash_transactions", ["registration_id"], :name => "cash_transactions_registration_id_fk"

  create_table "countries", :force => true do |t|
    t.string "description",       :limit => 50, :null => false
    t.string "short_description", :limit => 50, :null => false
  end

  create_table "data_types", :force => true do |t|
    t.string "key",         :limit => 8,  :null => false
    t.string "description", :limit => 64, :null => false
  end

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

  add_index "events", ["country_id"], :name => "events_country_id_fk"

  create_table "field_types", :force => true do |t|
    t.string "description", :limit => 128, :null => false
  end

  create_table "field_values", :force => true do |t|
    t.integer  "field_id",        :default => 0, :null => false
    t.text     "value",                          :null => false
    t.integer  "registration_id", :default => 0, :null => false
    t.datetime "updated_at"
  end

  add_index "field_values", ["field_id"], :name => "field_values_field_id_fk"
  add_index "field_values", ["registration_id"], :name => "field_values_registration_id_fk"

  create_table "fields", :force => true do |t|
    t.integer "type_id",                     :default => 0, :null => false
    t.text    "description",                                :null => false
    t.integer "event_id",                    :default => 0, :null => false
    t.integer "priority",                    :default => 0, :null => false
    t.integer "required",                    :default => 0, :null => false
    t.string  "invalid",      :limit => 128,                :null => false
    t.integer "hidden",                      :default => 0, :null => false
    t.integer "data_type_id",                :default => 0, :null => false
  end

  add_index "fields", ["data_type_id"], :name => "fields_data_type_id_fk"
  add_index "fields", ["event_id"], :name => "fields_event_id_fk"
  add_index "fields", ["type_id"], :name => "fields_type_id_fk"

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

  add_index "people", ["country_id"], :name => "people_country_id_fk"
  add_index "people", ["gender_id"], :name => "people_gender_id_fk"
  add_index "people", ["province_id"], :name => "people_province_id_fk"

  create_table "price_rule_types", :force => true do |t|
    t.string "description", :limit => 128, :null => false
  end

  create_table "price_rules", :force => true do |t|
    t.integer "event_id",                   :default => 0,   :null => false
    t.integer "type_id",                    :default => 0,   :null => false
    t.text    "description",                                 :null => false
    t.integer "field_id",                   :default => 0,   :null => false
    t.string  "value",       :limit => 128,                  :null => false
    t.float   "discount",                   :default => 0.0, :null => false
  end

  add_index "price_rules", ["event_id"], :name => "price_rules_event_id_fk"
  add_index "price_rules", ["field_id"], :name => "price_rules_field_id_fk"
  add_index "price_rules", ["type_id"], :name => "price_rules_type_id_fk"

  create_table "provinces", :force => true do |t|
    t.string  "description",       :limit => 50, :null => false
    t.string  "short_description", :limit => 50, :null => false
    t.integer "country_id"
  end

  add_index "provinces", ["country_id"], :name => "provinces_country_id_fk"

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

  create_table "scholarships", :force => true do |t|
    t.integer "registration_id",                   :default => 0,   :null => false
    t.float   "amount",                            :default => 0.0, :null => false
    t.string  "source_account",     :limit => 64,                   :null => false
    t.string  "source_description", :limit => 128,                  :null => false
  end

  add_index "scholarships", ["registration_id"], :name => "scholarships_registration_id_fk"

  add_foreign_key "assignments", "assignment_statuses", :name => "assignments_status_id_fk", :column => "status_id", :dependent => :delete
  add_foreign_key "assignments", "campuses", :name => "assignments_campus_id_fk", :dependent => :delete
  add_foreign_key "assignments", "people", :name => "assignments_person_id_fk", :dependent => :delete

  add_foreign_key "cash_transactions", "registrations", :name => "cash_transactions_registration_id_fk", :dependent => :delete

  add_foreign_key "events", "countries", :name => "events_country_id_fk", :dependent => :delete

  add_foreign_key "field_values", "fields", :name => "field_values_field_id_fk", :dependent => :delete
  add_foreign_key "field_values", "registrations", :name => "field_values_registration_id_fk", :dependent => :delete

  add_foreign_key "fields", "data_types", :name => "fields_data_type_id_fk", :dependent => :delete
  add_foreign_key "fields", "events", :name => "fields_event_id_fk", :dependent => :delete
  add_foreign_key "fields", "field_types", :name => "fields_type_id_fk", :column => "type_id", :dependent => :delete

  add_foreign_key "people", "countries", :name => "people_country_id_fk", :dependent => :delete
  add_foreign_key "people", "genders", :name => "people_gender_id_fk", :dependent => :delete
  add_foreign_key "people", "provinces", :name => "people_province_id_fk", :dependent => :delete

  add_foreign_key "price_rules", "events", :name => "price_rules_event_id_fk", :dependent => :delete
  add_foreign_key "price_rules", "fields", :name => "price_rules_field_id_fk", :dependent => :delete
  add_foreign_key "price_rules", "price_rule_types", :name => "price_rules_type_id_fk", :column => "type_id", :dependent => :delete

  add_foreign_key "provinces", "countries", :name => "provinces_country_id_fk", :dependent => :delete

  add_foreign_key "registrations", "events", :name => "registrations_event_id_fk", :dependent => :delete
  add_foreign_key "registrations", "people", :name => "registrations_person_id_fk", :dependent => :delete
  add_foreign_key "registrations", "registration_statuses", :name => "registrations_status_id_fk", :column => "status_id", :dependent => :delete

  add_foreign_key "scholarships", "registrations", :name => "scholarships_registration_id_fk", :dependent => :delete

end
