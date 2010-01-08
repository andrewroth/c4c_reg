class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.string :description,       :null => false, :limit => 50
      t.string :short_description, :null => false, :limit => 50
      t.integer :country_id,       :default => nil

    end
  end

  def self.down
    drop_table :provinces
  end
end
