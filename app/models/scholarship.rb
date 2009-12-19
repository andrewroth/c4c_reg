class Scholarship < ActiveRecord::Base

  load_mappings

  belongs_to :registration, :foreign_key => _(:registration_id)

end
