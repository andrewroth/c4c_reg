class Registration < ActiveRecord::Base

  belongs_to :event, :class_name => "Event", :foreign_key => _(:event_id)
  belongs_to :person, :class_name => "Person", :foreign_key => _(:person_id)
  belongs_to :registration_status, :class_name => "Registration", :foreign_key => _(:status_id)
  
  load_mappings
end
