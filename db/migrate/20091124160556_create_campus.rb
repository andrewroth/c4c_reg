class CreateCampus < ActiveRecord::Migration
  def self.up
    create_table :campus do |t|
      t.string :description,        :null => false,  :limit => 128
      t.string :short_description,  :null => false,  :limit => 50
      t.integer :account_group_id,  :null => false
      t.integer :region_id,         :null => false
      t.string :website,            :null => false,  :limit => 128
      t.string :facebook_group,     :null => false,  :limit => 128
      t.string :gcx_namespace,      :null => false,  :limit => 128
      t.integer :province_id
    end
  end

  def self.down
    drop_table :campus
  end
end
