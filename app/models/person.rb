class Person < ActiveRecord::Base

  has_many :registrations
  has_many :assignments
  
  load_mappings
  
end
