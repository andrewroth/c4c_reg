class Registration < ActiveRecord::Base

  belongs_to :event
  belongs_to :person
  belongs_to :registration_status
  
  load_mappings
end
