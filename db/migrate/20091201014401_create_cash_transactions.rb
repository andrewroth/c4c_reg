class CreateCashTransactions < ActiveRecord::Migration
  def self.up
    create_table :cash_transactions do |t|
      t.integer :registration_id, :null => false
      t.string :staff_name,       :null => false, :limit => 64
      t.integer :received,        :null => false
      t.float :amount_paid,       :null => false
      t.datetime :date,           :null => false
    end
  end

  def self.down
    drop_table :cash_transactions
  end
end
