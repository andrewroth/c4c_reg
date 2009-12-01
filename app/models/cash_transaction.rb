class CashTransaction < ActiveRecord::Base

  load_mappings
  
  belongs_to :registration, :class_name => "Registration", :foreign_key => _(:registration_id)

end
