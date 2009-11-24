class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name,         :null => false,  :limit => 50
      t.string :last_name,          :null => false,  :limit => 50
      t.string :legal_first_name,   :null => false,  :limit => 50
      t.string :legal_last_name,    :null => false,  :limit => 50
      t.string :phone,              :null => false,  :limit => 50
      t.string :email,              :null => false,  :limit => 128
      t.string :address,            :null => false,  :limit => 128
      t.string :city,               :null => false,  :limit => 50
      t.integer :province_id,       :null => false,  :default => 0
      t.string :postal_code,        :null => false,  :limit => 50
      t.integer :gender_id,         :null => false,  :default => 0
      t.string :local_phone,        :null => false,  :limit => 50
      t.string :local_address,      :null => false,  :limit => 128
      t.string :local_city,         :null => false,  :limit => 50
      t.string :local_postal_code,  :null => false,  :limit => 50
      t.integer :local_province_id, :null => false,  :default => 0
      t.string :cell_phone,                          :limit => 255
      t.date :local_valid_until
      t.integer :title_id
      t.integer :country_id
      t.integer :local_country_id
      t.string :middle_name,                         :limit => 255
    end
  end

  def self.down
    drop_table :people
  end
end
