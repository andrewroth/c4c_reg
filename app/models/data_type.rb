class DataType < ActiveRecord::Base

  load_mappings

  has_many :fields, :foreign_key => _(:data_type_id, :field)

end
