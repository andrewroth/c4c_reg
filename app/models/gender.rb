class Gender < ActiveRecord::Base

  load_mappings

  has_many :people, :foreign_key => _(:gender_id, :person)

  # these constants must equal their respective records in the genders table
  MALE = "Male"
  FEMALE = "Female"
  UNKNOWN = "???"


  def self.get_all_genders(order_field = :id, order = "DESC")
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    Gender.all(:order => _(order_field) + " " + order + ", " + _(:id) + " " + order)
  end

end
