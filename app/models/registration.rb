class Registration < ActiveRecord::Base

  load_mappings

  belongs_to :event, :class_name => "Event", :foreign_key => _(:event_id)
  belongs_to :person, :class_name => "Person", :foreign_key => _(:person_id)
  has_many :cash_transactions, :class_name => "CashTransaction", :foreign_key => _(:registration_id, :cash_transaction)

  # NOTE: registration_status is the registration foreign key in the legacy db (through db_mappings) while it is also the conventional name for this association
  #       but if they remain the same strange things will happen, so we must name it something else here!
  belongs_to :registration_status_assoc, :class_name => "RegistrationStatus", :foreign_key => _(:status_id)

  
  def cash_received()
    cash = "no"
    self.cash_transactions.each { |transaction| cash = "yes" if transaction.received == 1 }
    cash
  end


  def staff_names_for_cash_transactions
    self.cash_transactions.collect{|t| t.staff_name}.uniq.join(", ")
  end


  def get_applicable_rules
    rules = {}

    self.event.price_rules.each do |price_rule|
      if price_rule.applies_to_registration?(self) then
        rules[price_rule.id] = {}
        rules[price_rule.id][:discount] = price_rule.discount
        rules[price_rule.id][:description] = price_rule.description
      end
    end

    rules
  end
  

  def get_base_price_from_rules(rules)
    base_price = self.event.price

    rules.each_pair do |id, rule|
      base_price += rule[:discount]
    end

    base_price
  end


  def get_total_cash_paid()
    cash_sum = self.cash_transactions.all(:select => "SUM(#{__(:amount_paid, :cash_transaction)}) AS total_cash_paid")
    cash_sum.first.total_cash_paid
  end


  def get_total_scholarship

end
