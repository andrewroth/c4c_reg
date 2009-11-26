class RegistrationStatus < ActiveRecord::Base

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:id)

end
