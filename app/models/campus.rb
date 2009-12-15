class Campus < ActiveRecord::Base

  load_mappings

  has_many :assignments, :class_name => "Assignment", :foreign_key => _(:campus_id, :assignment)
  
end
