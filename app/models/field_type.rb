class FieldType < ActiveRecord::Base

  load_mappings

  has_many :fields, :foreign_key => _(:type_id, :field)
  

  # these constants must equal their respective records in the field_types table
  CHECKBOX = "checkbox"
  TEXTBOX = "textbox"
  TEXTAREA = "textarea"
  PASSWORD = "password"

end
