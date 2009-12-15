class Gender < ActiveRecord::Base

  load_mappings

  has_many :people, :class_name => "Person", :foreign_key => _(:gender_id, :person)

  # these constants must equal their respective records in the genders table
  MALE = "Male"
  FEMALE = "Female"
  UNKNOWN = "???"

end
