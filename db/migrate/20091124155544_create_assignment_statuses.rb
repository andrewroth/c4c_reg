class CreateAssignmentStatuses < ActiveRecord::Migration
  def self.up
    create_table :assignment_statuses do |t|
      t.string :description,  :null => false,  :limit => 64
    end
  end

  def self.down
    drop_table :assignment_statuses
  end
end
