class CreateGenders < ActiveRecord::Migration
  def self.up
    create_table :genders do |t|
      t.string :description,  :null => false,  :limit => 50
    end
  end

  def self.down
    drop_table :genders
  end
end
