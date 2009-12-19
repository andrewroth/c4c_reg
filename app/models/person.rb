class Person < ActiveRecord::Base

  load_mappings

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:person_id, :registration)
  has_many :assignments, :class_name => "Assignment", :foreign_key => _(:person_id, :assignment)
  has_many :events, :through => :registrations
  belongs_to :gender, :class_name => "Gender", :foreign_key => _(:gender_id)



  def get_best_assigned_campus()

    # people have multiple assignments to campuses and there is no good way to pick just one
    # do our best to pick the most appropriate campus assignment by picking the one with
    # the highest id where that person has student status
    # if the person has no assignments with student status just pick the highest id

    assignment = self.assignments.first( :joins => :assignment_status,
                                         :conditions => ["#{__(:description, :assignment_status)} = ?", AssignmentStatus::CURRENT_STUDENT],
                                         :order => "#{__(:id, :assignment)} DESC" )

    if !assignment then
      assignment = self.assignments.first( :order => "#{__(:id, :assignment)} DESC" )
    end

    assignment.campus
  end

end
