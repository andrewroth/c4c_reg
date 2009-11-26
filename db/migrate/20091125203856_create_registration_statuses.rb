class CreateRegistrationStatuses < ActiveRecord::Migration
  def self.up
    create_table :registration_statuses do |t|
      t.string :description,  :null => false,  :limit => 32
    end
  end

  def self.down
    drop_table :registration_statuses
  end
end
