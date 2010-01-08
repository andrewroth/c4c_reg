class CashTransaction < ActiveRecord::Base

  load_mappings
  
  belongs_to :registration, :foreign_key => _(:registration_id)

  # these constants aren't in the database
  # they define what is displayed as summary for all cash transactions of a registration
  CASH_RECEIVED = "yes"
  NO_CASH_RECEIVED = "no"
  SOME_CASH_RECEIVED = "partially"
  NO_CASH_TRANSACTIONS = ""

end
