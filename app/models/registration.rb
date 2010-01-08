class Registration < ActiveRecord::Base

  load_mappings

  belongs_to :event, :foreign_key => _(:event_id)
  belongs_to :person, :foreign_key => _(:person_id)
  has_many :cash_transactions, :foreign_key => _(:registration_id, :cash_transaction)
  has_many :scholarships, :foreign_key => _(:registration_id, :scholarship)
  has_many :field_values, :foreign_key => _(:registration_id, :field_value)

  # NOTE: registration_status is the registration foreign key in the legacy db (through db_mappings) while it is also the conventional name for this association
  #       but if they remain the same strange things will happen, so we must name it something else here!
  belongs_to :registration_status_assoc, :class_name => "RegistrationStatus", :foreign_key => _(:status_id)

  
  def cash_received()
    cash = CashTransaction::NO_CASH_TRANSACTIONS
    yes = false
    no = false

    self.cash_transactions.each do |transaction|
      if transaction.received == 1
        yes = true
      else
        no = true
      end
    end

    if no and yes then
      cash = CashTransaction::SOME_CASH_RECEIVED
    elsif no then
      cash = CashTransaction::NO_CASH_RECEIVED
    elsif yes then
      cash = CashTransaction::CASH_RECEIVED
    else
      cash = CashTransaction::NO_CASH_TRANSACTIONS
    end

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
    base_price = self.event.price.to_f

    rules.each_pair do |id, rule|
      base_price += rule[:discount].to_f
    end

    base_price.to_f
  end


  def get_total_cash_paid()
    cash_paid = self.cash_transactions.all(:select => "SUM(#{__(:amount_paid, :cash_transaction)}) AS total",
                                           :conditions => ["#{__(:received, :cash_transaction)} = ?", true])
    cash_paid.first.total.to_f
  end


  def get_total_cash_owed()
    cash_owed = self.cash_transactions.all(:select => "SUM(#{__(:amount_paid, :cash_transaction)}) AS total",
                                           :conditions => ["#{__(:received, :cash_transaction)} = ?", false])
    cash_owed.first.total.to_f
  end


  def get_total_scholarship()
    scholarship_sum = self.scholarships.all(:select => "SUM(#{__(:amount, :scholarship)}) AS total_scholarship_worth")
    scholarship_sum.first.total_scholarship_worth.to_f
  end


  def get_event_field()
    self.field_values.all(:joins => :field,
                          :select => "#{__(:description, :field)} AS description, #{__(:value, :field_value)}")
  end

end
