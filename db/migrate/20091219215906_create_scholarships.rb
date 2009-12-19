class CreateScholarships < ActiveRecord::Migration
  def self.up
    create_table :scholarships do |t|
      t.integer :registration_id,    :null => false, :default => 0
      t.float :amount,               :null => false, :default => 0
      t.string :source_account,      :null => false, :limit => 64
      t.string :source_description,  :null => false, :limit => 128

    end
  end

  def self.down
    drop_table :scholarships
  end
end
