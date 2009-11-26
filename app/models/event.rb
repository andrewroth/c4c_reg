class Event < ActiveRecord::Base

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:id)

  load_mappings
  
end
