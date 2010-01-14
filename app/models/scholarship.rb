class Scholarship < ActiveRecord::Base

  load_mappings

  belongs_to :registration, :foreign_key => _(:registration_id)

  validates_presence_of :amount, :source_account, :source_description
  validates_numericality_of :amount

end
