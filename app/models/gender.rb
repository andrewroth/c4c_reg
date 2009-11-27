class Gender < ActiveRecord::Base

  load_mappings

  has_many :people, :class_name => "Person", :foreign_key => _(:id)

end
