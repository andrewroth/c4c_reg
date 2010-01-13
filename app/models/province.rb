class Province < ActiveRecord::Base

  load_mappings

  belongs_to :country, :foreign_key => _(:country_id)

  # constants must equal their respective records in the countries table
  UNKNOWN = "Unknown"
  

  def province(*args)
    super
  end


  def self.get_all_provinces(order_field = :id, order = "DESC")
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    # new nil province to handle province_id being 0
    [Province.new].concat(Province.all(:order => _(order_field) + " " + order + ", " + _(:id) + " " + order))
  end


  def self.get_all_provinces_from_country(country, order_field = :id, order = "DESC")
    country ||= ""
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    # new nil province to handle province_id being 0
    [Province.new].concat(Province.all(:joins => :country,
                                       :order => _(order_field) + " " + order + ", " + _(:id) + " " + order,
                                       :conditions => ["#{__(:description, :country)} = ?", country]))
  end

end
