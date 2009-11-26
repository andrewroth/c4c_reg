class AssignmentStatus < ActiveRecord::Base

  has_many :assignments, :class_name => "Assignment", :foreign_key => _(:id)
  
  load_mappings
  
end
