class Person < ActiveRecord::Base

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:id)
  has_many :assignments, :class_name => "Assignment", :foreign_key => _(:id)
  belongs_to :gender, :class_name => "Gender", :foreign_key => _(:gender_id)
  
  load_mappings
  
end
