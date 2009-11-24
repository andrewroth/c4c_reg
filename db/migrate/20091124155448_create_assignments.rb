class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :person_id,  :null => false,  :default => 0
      t.integer :campus_id,  :null => false,  :default => 0
      t.integer :status_id,  :null => false,  :default => 0
    end
  end

  def self.down
    drop_table :assignments
  end
end
