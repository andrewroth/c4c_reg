class CreatePriceRules < ActiveRecord::Migration
  def self.up
    create_table :price_rules do |t|
      t.integer :event_id,  :null => false,  :default => 0
      t.integer :type_id,   :null => false,  :default => 0
      t.text :description,  :null => false
      t.integer :field_id,  :null => false,  :default => 0
      t.string :value,      :null => false,  :limit => 128
      t.float :discount,    :null => false,  :default => 0

    end
  end

  def self.down
    drop_table :price_rules
  end
end
