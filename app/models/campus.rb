class Campus < ActiveRecord::Base

  load_mappings

  has_many :assignments, :foreign_key => _(:campus_id, :assignment)
  
end
