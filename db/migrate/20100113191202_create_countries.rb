class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :description,       :null => false, :limit => 50
      t.string :short_description, :null => false, :limit => 50

    end
  end

  def self.down
    drop_table :countries
  end
end
