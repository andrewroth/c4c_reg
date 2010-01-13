class Province < ActiveRecord::Base

  load_mappings

  belongs_to :country, :foreign_key => _(:country_id)
  

  def self.get_all_provinces(order_field = :id, order = "DESC")
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    Province.all(:order => _(order_field) + " " + order + ", " + _(:id) + " " + order)
  end


  def self.get_all_provinces_from_country(country, order_field = :id, order = "DESC")
    country ||= ""
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    Province.all(:joins => :country,
                 :order => _(order_field) + " " + order + ", " + _(:id) + " " + order,
                 :conditions => ["#{__(:description, :country)} = ?", country])
  end

end
