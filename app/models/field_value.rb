class FieldValue < ActiveRecord::Base

  load_mappings

  belongs_to :field, :foreign_key => _(:field_id)
  belongs_to :registration, :foreign_key => _(:registration_id)

end
