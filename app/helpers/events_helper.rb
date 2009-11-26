module EventsHelper

  def init_array!(array, lbound, ubound, value)
    lbound.upto(ubound) { |n|
      array[n] = value
    }
  end


  def per_campus_event_info(event)
    
    # info will be a hash of hashes, so that it can be accessed via a campus' id
    # (in the legacy db the ids are not sequential so an array would not work)
    info = {}
    
    Campus.find(:all).each do |c|
      info.merge!({ c.id => { :name => c.description, :gender => [], :status => [] }})

      init_array!(info[c.id][:gender], 0, Gender.maximum(:id), 0)
      init_array!(info[c.id][:status], 0, RegistrationStatus.maximum(:id), 0)
    end
    
    info.merge!({ :total => { :gender => [], :status => [] }})
    init_array!(info[:total][:gender], 0, Gender.maximum(:id), 0)
    init_array!(info[:total][:status], 0, RegistrationStatus.maximum(:id), 0)

    
    event.registrations.each do |registration|
      registration.person.assignments.each do |assignment|
        
        info[assignment.campus.id][:gender][registration.person.gender_id] += 1
        
        info[assignment.campus.id][:status][registration.status_id] += 1
        
      end
      
      info[:total][:gender][registration.person.gender_id] += 1

      info[:total][:status][registration.status_id] += 1
    end
  
    info
  end

end
