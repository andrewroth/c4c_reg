class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.integer :event_id,    :null => false,  :default => 0
      t.integer :person_id,   :null => false,  :default => 0
      t.timestamp :date,      :null => false,  :default => '0000-00-00 00:00:00'
      t.string :confirm_num,  :null => false,  :limit => 64
      t.integer :status,      :null => false,  :default => 0
      t.float :balance,       :null => false,  :default => 0
    end
  end

  def self.down
    drop_table :registrations
  end
end
