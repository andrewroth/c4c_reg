class Country < ActiveRecord::Base

  load_mappings

  has_many :events
  has_many :people
  has_many :provinces

  # constants must equal their respective records in the countries table
  CANADA = "Canada"

end
