require 'ordered_hash_sort.rb'

class Event < ActiveRecord::Base

  load_mappings

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:event_id, :registration)
  has_many :people, :through => :registrations



  # return all events
  #   order_field  symbol for field to sort by
  #   order        optional, should be "ASC" or "DESC"
  def self.get_all_events(order_field, order = "DESC")

    order = order.upcase
    order = "DESC" if (order != "ASC" && order != "DESC")

    Event.find(:all, :order => _(order_field) + " " + order + ", " + _(:id) + " " + order)

  end


  # get registration totals for gender and registration status for this event
  # returns a hash of hashes
  def info_totals()

    registrations = Assignment.all( :joins => [ :person => [ { :registrations => :registration_status_assoc }, :gender ] ],
                                    :select => "DISTINCT #{__(:id, :person)} AS person_id, #{__(:description, :gender)} AS gender, #{__(:description, :registration_status)} AS status",
                                    :conditions => [ "#{__(:event_id, :registration)} = ?", self.id ] )

    info_totals = { :gender => { :male => 0, :female => 0, :unknown => 0 },
                    :status => { :cancelled => 0, :registered => 0, :incomplete => 0 } }

    info_totals[:gender][:male]      = registrations.find_all{ |registration| registration.gender == Gender::MALE }.size
    info_totals[:gender][:female]    = registrations.find_all{ |registration| registration.gender == Gender::FEMALE }.size
    info_totals[:gender][:unknown]    = registrations.find_all{ |registration| registration.gender == Gender::UNKNOWN }.size
    info_totals[:status][:cancelled]  = registrations.find_all{ |registration| registration.status == RegistrationStatus::CANCELLED }.size
    info_totals[:status][:registered] = registrations.find_all{ |registration| registration.status == RegistrationStatus::REGISTERED }.size
    info_totals[:status][:incomplete] = registrations.find_all{ |registration| registration.status == RegistrationStatus::INCOMPLETE }.size

    info_totals
  end


  # get per-campus gender and registration status counts for this event
  # returns a hash of hashes accessed by campus id
  def per_campus_event_info()

    campus_info = ActiveSupport::OrderedHash.new # will contain gender and registration status info for each campus
    
#    registrations = ActiveSupport::OrderedHash.new # will contain a reference to each registration with it's status and that person's gender
    

#    campuses = Campus.all( :include => { :assignments => { :person => [ { :registrations => :registration_status_assoc }, :gender ] } },
#
#                           :select => "#{__(:description, :campus)}, #{__(:description, :gender)}, #{__(:description, :registration_status)}",
#
#                           :conditions => [ "#{__(:event_id, :registration)} = ?", self.id ] )


    campuses = Assignment.all( :joins => [ :campus, { :person => [ { :registrations => :registration_status_assoc }, :gender ] } ],

                               :select => "#{__(:id, :campus)} AS campusID, " +
                                          "#{__(:description, :campus)} AS name, " +
                                          "SUM(#{__(:description, :gender)} = '#{Gender::MALE}') AS males, " +
                                          "SUM(#{__(:description, :gender)} = '#{Gender::FEMALE}') AS females, " +
                                          "SUM(#{__(:description, :gender)} = '#{Gender::UNKNOWN}') AS unknowns, " +
                                          "SUM(#{__(:description, :registration_status)} = '#{RegistrationStatus::CANCELLED}') AS cancelled, " +
                                          "SUM(#{__(:description, :registration_status)} = '#{RegistrationStatus::REGISTERED}') AS registered, " +
                                          "SUM(#{__(:description, :registration_status)} = '#{RegistrationStatus::INCOMPLETE}') AS incomplete",

                               :group => "#{__(:id, :campus)}",

                               :conditions => [ "#{__(:event_id, :registration)} = ?", self.id ] )
    
    campuses.each do |campus|
      campus_info.merge!( campus.campusID => { :name => "", :gender => { :male => 0, :female => 0, :unknown => 0 }, :status => { :cancelled => 0, :registered => 0, :incomplete => 0 } } )

      campus_info[campus.campusID][:name] = campus.name
      campus_info[campus.campusID][:gender][:male] = campus.males.to_i
      campus_info[campus.campusID][:gender][:female] = campus.females.to_i
      campus_info[campus.campusID][:gender][:unknown] = campus.unknowns.to_i
      campus_info[campus.campusID][:status][:cancelled] = campus.cancelled.to_i
      campus_info[campus.campusID][:status][:registered] = campus.registered.to_i
      campus_info[campus.campusID][:status][:incomplete] = campus.incomplete.to_i
    end

    # sort the hash by campus name
    campus_info = campus_info.sorted_hash{ |a, b| a[1][:name] <=> b[1][:name]}
    
    







#
#    campuses = Assignment.all( :joins => [ :person => [ { :registrations => :registration_status_assoc }, :gender ] ],
#
#                               :select => "DISTINCT #{__(:id, :person)}, " +
#                                          "SUM( #{__(:description, :gender)} = '#{Gender::MALE}') AS males, " +
#                                          "SUM( #{__(:description, :gender)} = '#{Gender::FEMALE}') AS females, " +
#                                          "SUM( #{__(:description, :gender)} = '#{Gender::UNKNOWN}') AS unknowns, " +
#                                          "SUM( #{__(:description, :registration_status)} = '#{RegistrationStatus::CANCELLED}') AS cancelled, " +
#                                          "SUM( #{__(:description, :registration_status)} = '#{RegistrationStatus::REGISTERED}') AS registered, " +
#                                          "SUM( #{__(:description, :registration_status)} = '#{RegistrationStatus::INCOMPLETE}') AS incomplete",
#
#                               :conditions => [ "#{__(:event_id, :registration)} = ?", self.id ] )
#
#
#
#
#
#
#
#
#
#
#
#    assignments = Assignment.all( :joins => [ { :person => [ :gender, {:registrations => :registration_status_assoc} ] }, :campus ],
#
#                                  :select => "#{__(:id, :campus)} AS campus_id, " +
#                                             "#{__(:description, :campus)} AS campus_description, " +
#                                             "#{__(:description, :gender)} AS gender, " +
#                                             "#{__(:description, :registration_status)} AS registration_status, " +
#                                             "#{__(:id, :registration)} AS registration_id",
#
#                                  :conditions => [ "#{Registration.table_name}.#{_(:event_id, :registration)} = ?", self.id ] )
#
#
#    # go through each person's (who has registered for this event) assignments
#    assignments.each do |assignment|
#
#      # if we haven't encountered this campus_id yet add it to the campus_info hash
#      merge_if_not_present(campus_info, assignment.campus_id.to_i => { :name => assignment.campus_description,
#                                                                       :gender => {},
#                                                                       :status => {} })
#
#      # if we haven't encountered this gender yet add it to the campus_id hash
#      merge_if_not_present( campus_info[assignment.campus_id.to_i][:gender], assignment.gender => 0 )
#
#      # if we haven't encountered this registration_status yet add it to the campus_id hash
#      merge_if_not_present( campus_info[assignment.campus_id.to_i][:status], assignment.registration_status => 0 )
#
#      campus_info[assignment.campus_id.to_i][:gender][assignment.gender] += 1
#      campus_info[assignment.campus_id.to_i][:status][assignment.registration_status] += 1
#
#      registrations.merge!( { assignment.registration_id => { :gender => assignment.gender, :status => assignment.registration_status }} )
#    end
#
#    # sort the hash by campus name
#    campus_info = campus_info.sorted_hash{ |a, b| a[1][:name] <=> b[1][:name]}
#
#
#    # find totals for gender and registration status
#
#    campus_info.merge!( :total => { :name => "Totals", :gender => {}, :status => {} } )
#
#    registrations.each_value do |info|
#
#      # if we haven't encountered this gender_id yet add it to the campus_id hash
#      merge_if_not_present( campus_info[:total][:gender], info[:gender] => 0 )
#
#      # if we haven't encountered this registration_status yet add it to the campus_id hash
#      merge_if_not_present( campus_info[:total][:status], info[:status] => 0 )
#
#      campus_info[:total][:gender][info[:gender]] += 1
#      campus_info[:total][:status][info[:status]] += 1
#
#    end

    campus_info
  end


  def registrations_from_campus(campus)

    Registration.all( :include => [ { :person => { :assignments => :campus } }, :registration_status_assoc, :cash_transactions ],

                      :select => "#{__(:id, :campus)}, #{__(:first_name, :person)}, #{__(:last_name, :person)}, #{__(:email, :person)}, " +
                                 "#{__(:received, :cash_transaction)}, #{__(:staff_name, :cash_transaction)}, " +
                                 "#{__(:description, :registration_status)}, #{__(:date, :registration)}, #{__(:balance, :registration)}, #{__(:id, :registration)}",

                      :conditions => [ "#{__(:event_id, :registration)} = ? AND #{__(:id, :campus)} = ?", self.id, campus.id ] )


#    Registration.all( :include => [ { :person => { :assignments => :campus } }, :registration_status_assoc, :cash_transactions ],

#                                      :select => "#{Campus.table_name}.#{_(:id, :campus)} AS campus_id, " +
#                                                 "#{Person.table_name}.#{_(:first_name, :person)} AS first_name, " +
#                                                 "#{Person.table_name}.#{_(:last_name, :person)} AS last_name, " +
#                                                 "#{Person.table_name}.#{_(:email, :person)} AS email, " +
#                                                 "#{RegistrationStatus.table_name}.#{_(:description, :registration_status)} AS registration_status, " +
#                                                 "#{Registration.table_name}.#{_(:date, :registration)} AS date, " +
#                                                 "#{Registration.table_name}.#{_(:balance, :registration)} AS balance, " +
#                                                 "#{Registration.table_name}.#{_(:id, :registration)} AS registration_id",

#                                      :conditions => [ "#{Registration.table_name}.#{_(:event_id, :registration)} = ? AND " +
#                                                       "#{Campus.table_name}.#{_(:id, :campus)} = ?", +
#                                                       self.id, campus.id ] )
  end


end
