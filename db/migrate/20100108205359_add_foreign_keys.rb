class AddForeignKeys < ActiveRecord::Migration
  def self.up

    add_foreign_key(:registrations, :events, :dependent => :delete)
    
    add_foreign_key(:cash_transactions, :registrations, :dependent => :delete)
    
    add_foreign_key(:registrations, :registration_statuses, :column => 'status_id', :dependent => :delete)
    add_foreign_key(:registrations, :people, :dependent => :delete)
    
    add_foreign_key(:people, :genders, :dependent => :delete)
    add_foreign_key(:people, :provinces, :dependent => :delete)
    
    add_foreign_key(:assignments, :people, :dependent => :delete)
    add_foreign_key(:assignments, :campuses, :dependent => :delete)
    add_foreign_key(:assignments, :assignment_statuses, :column => 'status_id', :dependent => :delete)
    
    add_foreign_key(:price_rules, :price_rule_types, :column => 'type_id', :dependent => :delete)
    add_foreign_key(:price_rules, :events, :dependent => :delete)
    add_foreign_key(:price_rules, :fields, :dependent => :delete)
    
    add_foreign_key(:fields, :events, :dependent => :delete)
    add_foreign_key(:fields, :data_types, :dependent => :delete)
    add_foreign_key(:fields, :field_types, :column => 'type_id', :dependent => :delete)
    
    add_foreign_key(:field_values, :registrations, :dependent => :delete)
    add_foreign_key(:field_values, :fields, :dependent => :delete)
    
    add_foreign_key(:scholarships, :registrations, :dependent => :delete)
    
  end


  def self.down

    remove_foreign_key(:registrations, :events)
    
    remove_foreign_key(:cash_transactions, :registrations)
    
    remove_foreign_key(:registrations, :column => 'status_id')
    remove_foreign_key(:registrations, :people)
    
    remove_foreign_key(:people, :genders)
    remove_foreign_key(:people, :provinces)
    
    remove_foreign_key(:assignments, :people)
    remove_foreign_key(:assignments, :campuses)
    remove_foreign_key(:assignments, :column => 'status_id')
    
    remove_foreign_key(:price_rules, :column => 'type_id')
    remove_foreign_key(:price_rules, :events)
    remove_foreign_key(:price_rules, :fields)
    
    remove_foreign_key(:fields, :events)
    remove_foreign_key(:fields, :data_types)
    remove_foreign_key(:fields, :column => 'type_id')
   
    remove_foreign_key(:field_values, :registrations)
    remove_foreign_key(:field_values, :fields)
    
    remove_foreign_key(:scholarships, :registrations)
    
  end
end
