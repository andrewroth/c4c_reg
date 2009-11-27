class Registration < ActiveRecord::Base

  load_mappings

  belongs_to :event, :class_name => "Event", :foreign_key => _(:event_id)
  belongs_to :person, :class_name => "Person", :foreign_key => _(:person_id)
  belongs_to :registration_status, :class_name => "RegistrationStatus", :foreign_key => _(:status_id)
  
end
