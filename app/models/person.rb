class Person < ActiveRecord::Base

  has_many :registrations
  has_many :assignments
  belongs_to :gender
  
  load_mappings
  
end
