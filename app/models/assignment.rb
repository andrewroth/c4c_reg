class Assignment < ActiveRecord::Base

  belongs_to :person, :class_name => "Person", :foreign_key => _(:person_id)
  belongs_to :campus, :class_name => "Campus", :foreign_key => _(:campus_id)
  belongs_to :assignment_status, :class_name => "AssignmentStatus", :foreign_key => _(:status_id)
  
  load_mappings
  
end
