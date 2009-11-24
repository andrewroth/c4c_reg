require 'db_mappings'

class Event < ActiveRecord::Base

  has_many :registrations

  load_mappings
  
end
