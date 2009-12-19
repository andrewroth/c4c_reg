class Assignment < ActiveRecord::Base

  load_mappings

  belongs_to :person, :foreign_key => _(:person_id)
  belongs_to :campus, :foreign_key => _(:campus_id)
  belongs_to :assignment_status, :foreign_key => _(:status_id)
  
end
