class CreatePriceRuleTypes < ActiveRecord::Migration
  def self.up
    create_table :price_rule_types do |t|
      t.string :description,  :null => false,  :limit => 128

    end
  end

  def self.down
    drop_table :price_rule_types
  end
end
