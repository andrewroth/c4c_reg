class AssignmentStatus < ActiveRecord::Base

  load_mappings

  has_many :assignments, :foreign_key => _(:status_id, :assignment)

  # these constants must equal their respective records in the assignment_statuses table
  CAMPUS_ALUMNI = "Campus Alumni"
  UNKNOWN = "Unknown Status"
  STAFF_ALUMNI = "Staff Alumni"
  ATTENDED = "Attended"
  STAFF = "Staff"
  ALUMNI = "Alumni"
  CURRENT_STUDENT = "Current Student"
  
end
