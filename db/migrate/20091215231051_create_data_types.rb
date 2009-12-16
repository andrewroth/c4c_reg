class CreateDataTypes < ActiveRecord::Migration
  def self.up
    create_table :data_types do |t|
      t.string :key,          :null => false,  :limit => 8
      t.string :description,  :null => false,  :limit => 64

    end
  end

  def self.down
    drop_table :data_types
  end
end
