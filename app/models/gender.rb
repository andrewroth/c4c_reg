class Gender < ActiveRecord::Base

  has_many :people, :class_name => "Person", :foreign_key => _(:id)

end
