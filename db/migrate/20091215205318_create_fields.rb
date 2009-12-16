class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :type_id,       :null => false,  :default => 0
      t.text :description,      :null => false
      t.integer :event_id,      :null => false,  :default => 0
      t.integer :priority,      :null => false,  :default => 0
      t.integer :required,      :null => false,  :default => 0
      t.string :invalid,        :null => false,  :limit => 128
      t.integer :hidden,        :null => false,  :default => 0
      t.integer :data_type_id,  :null => false,  :default => 0

    end
  end

  def self.down
    drop_table :fields
  end
end
