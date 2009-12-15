class RegistrationStatus < ActiveRecord::Base

  load_mappings

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:status_id, :registration)

  # these constants must equal their respective records in the registration_statuses table
  UNASSIGNED = "Unassigned"
  REGISTERED = "Registered"
  CANCELLED  = "Cancelled"
  INCOMPLETE = "Incomplete"
  
end
