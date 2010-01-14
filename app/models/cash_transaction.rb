class CashTransaction < ActiveRecord::Base

  load_mappings
  
  belongs_to :registration, :foreign_key => _(:registration_id)

  validates_presence_of :registration_id, :staff_name, :received, :amount_paid, :date
  validates_numericality_of :amount_paid


  # these constants aren't in the database
  # they define what is displayed as summary for all cash transactions of a registration
  CASH_RECEIVED = "yes"
  NO_CASH_RECEIVED = "no"
  SOME_CASH_RECEIVED = "partially"
  NO_CASH_TRANSACTIONS = ""


  def human_received
    case self.received
      when 0
        NO_CASH_RECEIVED
      when 1
        CASH_RECEIVED
    end
  end

end
