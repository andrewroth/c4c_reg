class Country < ActiveRecord::Base

  load_mappings

  has_many :events,    :foreign_key => _(:event_id, :event)
  has_many :people,    :foreign_key => _(:person_id, :person)
  has_many :provinces, :foreign_key => _(:province_id, :province)

  # constants must equal their respective records in the countries table
  CANADA = "Canada"

end
