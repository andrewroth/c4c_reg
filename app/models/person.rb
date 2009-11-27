class Person < ActiveRecord::Base

  load_mappings

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:id)
  has_many :assignments, :class_name => "Assignment", :foreign_key => _(:id)
  has_many :events, :through => :registrations
  belongs_to :gender, :class_name => "Gender", :foreign_key => _(:gender_id)
  
end
