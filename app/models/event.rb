require 'ordered_hash_sort.rb'

class Event < ActiveRecord::Base

  load_mappings

  has_many :registrations, :class_name => "Registration", :foreign_key => _(:id)
  has_many :people, :through => :registrations


  # get per-campus gender and registration status counts for this event
  # returns a hash of hashes
  def per_campus_event_info()

    # info will be a hash of hashes, so that it can be accessed via a campus' id
    # (in the legacy db the ids are not sequential so an array would not work)

    campus_info = ActiveSupport::OrderedHash.new # will contain gender and registration status info for each campus
    
    registrations = ActiveSupport::OrderedHash.new # will contain a reference to each registration with it's status and that person's gender
    

    assignments = Assignment.all( :joins => { :person => { :registrations => :event }, :campus => {}},
                                  :select => "#{Campus.table_name}.#{_(:id, :campus)}" + ", " + _(:description, :campus) + ", " + _(:id, :gender) + ", " + _(:status_id, :registration) + ", " + _(:id, :registration),
                                  :conditions => [ "#{Event.table_name}.#{_(:id, :event)} = ?", self.id ] )


    # go through each person's (who has registered for this event) assignments
    assignments.each do |assignment|

      # if we haven't encountered this campus_id yet add it to the campus_info hash
      merge_if_not_present(campus_info, assignment.campus_id.to_i => { :name => assignment.campus_desc, :gender => {}, :status => {} })

      # if we haven't encountered this gender_id yet add it to the campus_id hash
      merge_if_not_present( campus_info[assignment.campus_id.to_i][:gender], assignment.gender_id.to_i => 0 )

      # if we haven't encountered this registration_status yet add it to the campus_id hash
      merge_if_not_present( campus_info[assignment.campus_id.to_i][:status], assignment.registration_status.to_i => 0 )

      campus_info[assignment.campus_id.to_i][:gender][assignment.gender_id.to_i] += 1
      campus_info[assignment.campus_id.to_i][:status][assignment.registration_status.to_i] += 1

      registrations.merge!( { assignment.registration_id => { :gender => assignment.gender_id, :status => assignment.registration_status }} )
    end

    # sort by campus name
    campus_info = campus_info.sorted_hash{ |a, b| a[1][:name] <=> b[1][:name]}


    # find totals for gender and registration status

    campus_info.merge!( :total => { :name => "Totals", :gender => {}, :status => {} } )

    registrations.each_value do |info|

      # if we haven't encountered this gender_id yet add it to the campus_id hash
      merge_if_not_present( campus_info[:total][:gender], info[:gender].to_i => 0 )

      # if we haven't encountered this registration_status yet add it to the campus_id hash
      merge_if_not_present( campus_info[:total][:status], info[:status].to_i => 0 )
      
      campus_info[:total][:gender][info[:gender].to_i] += 1
      campus_info[:total][:status][info[:status].to_i] += 1

    end

    campus_info
  end


  private

  def merge_if_not_present(hashes, new_hash)

    new_hash_key = new_hash.keys

    if ! hashes[new_hash_key[0]]then
      hashes.merge!(new_hash)
    end

  end

end
