class Person < ActiveRecord::Base

  load_mappings

  has_many :registrations, :foreign_key => _(:person_id, :registration)
  has_many :assignments, :foreign_key => _(:person_id, :assignment)
  has_many :events, :through => :registrations
  belongs_to :gender, :foreign_key => _(:gender_id)
  belongs_to :province_assoc, :class_name => "Province", :foreign_key => _(:province_id)
  belongs_to :local_province_assoc, :class_name => "Province", :foreign_key => _(:local_province_id)
  belongs_to :country, :foreign_key => _(:country_id)
  

  validates_presence_of _(:first_name), _(:last_name), _(:email), _(:gender), _(:phone), _(:address), _(:city), _(:postal_code), _(:province)
  validates_email_format_of _(:email)


  # handle provinces with id of 0
  def province(*args)
    self.province_id == 0 ? Province.new : self.province_assoc(*args)
  end

  # handle local_provinces with id of 0
  def local_province(*args)
    self.local_province_id == 0 ? Province.new : self.local_province_assoc(*args)
  end


  def get_best_assigned_campus()

    # people can have multiple assignments to campuses and there is no good way to pick just one
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
