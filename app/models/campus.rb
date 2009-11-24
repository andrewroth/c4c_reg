class Campus < ActiveRecord::Base

  has_many :assignments
  
  load_mappings
  
end
