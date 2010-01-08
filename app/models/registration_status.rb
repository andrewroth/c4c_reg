class RegistrationStatus < ActiveRecord::Base

  load_mappings

  has_many :registrations, :foreign_key => _(:status_id, :registration)

  # these constants must equal their respective records in the registration_statuses table
  UNASSIGNED = "Unassigned"
  REGISTERED = "Registered"
  CANCELLED  = "Cancelled"
  INCOMPLETE = "Incomplete"


  # return all statuses
  #   order_field  symbol for field to sort by
  #   order        optional, should be "ASC" or "DESC"
  def self.get_all_statuses(order_field, order = "DESC")
    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    RegistrationStatus.find(:all, :order => _(order_field) + " " + order + ", " + _(:id) + " " + order)
  end

end
