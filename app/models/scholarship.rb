class Scholarship < ActiveRecord::Base

  load_mappings

  belongs_to :registration, :foreign_key => _(:registration_id)

  validates_presence_of _(:amount), _(:source_account), _(:source_description)
  validates_numericality_of _(:amount)

end
