class Assignment < ActiveRecord::Base

  belongs_to :person
  belongs_to :campus
  belongs_to :assignment_status
  
  load_mappings
  
end
