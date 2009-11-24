class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :country,       :null => false,  :default => 0
      t.integer :ministry,      :null => false,  :default => 0
      t.string :name,           :null => false,  :limit => 128
      t.string :desc_brief,     :null => false,  :limit => 128 
      t.text :desc_detail,      :null => false
      t.datetime :start,        :null => false,  :default => '0000-00-00 00:00:00' 
      t.datetime :end,          :null => false,  :default => '0000-00-00 00:00:00' 
      t.datetime :reg_start,    :null => false,  :default => '0000-00-00 00:00:00' 
      t.datetime :reg_end,      :null => false,  :default => '0000-00-00 00:00:00' 
      t.string :website,        :null => false,  :limit => 128 
      t.text :email_text,       :null => false 
      t.float :price,           :null => false,  :default => 0 
      t.float :deposit,         :null => false,  :default => 0
      t.text :email,            :null => false
      t.text :price_text,       :null => false 
      t.boolean :on_home_page,  :null => false,  :default => 1 
      t.boolean :allow_cash,    :null => false,  :default => 0
    end
  end

  def self.down
    drop_table :events
  end
end
