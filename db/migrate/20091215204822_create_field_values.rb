class CreateFieldValues < ActiveRecord::Migration
  def self.up
    create_table :field_values do |t|
      t.integer :field_id,         :null => false,  :default => 0
      t.text :value,               :null => false
      t.integer :registration_id,  :null => false,  :default => 0
      t.timestamp :updated_at

    end
  end

  def self.down
    drop_table :field_values
  end
end
