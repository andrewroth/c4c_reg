class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :country
      t.integer :ministry
      t.string :name
      t.string :desc_brief
      t.text :desc_detail
      t.datetime :start
      t.datetime :end
      t.datetime :reg_start
      t.datetime :reg_end
      t.string :website
      t.text :email_text
      t.float :price
      t.float :deposit
      t.text :email
      t.text :price_text
      t.boolean :on_home_page
      t.boolean :allow_cash

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
