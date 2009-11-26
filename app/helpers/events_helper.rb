module EventsHelper

  def init_array!(array, lbound, ubound, value)
    lbound.upto(ubound) { |n|
      array[n] = value
    }
  end


  def per_campus_event_info(event)
    
    # info will be a hash of hashes, so that it can be accessed via a campus' id
    # (in the legacy db the ids are not sequential so an array would not work)
    campus_info = {}
    gender_max = Gender.maximum(:id)
    reg_max = RegistrationStatus.maximum(:id)

    Campus.find(:all).each do |c|
      campus_info.merge!({ c.id => { :name => c.description, :gender => [], :status => [] }})

      init_array!(campus_info[c.id][:gender], 0, gender_max, 0)
      init_array!(campus_info[c.id][:status], 0, reg_max, 0)
    end
    
    campus_info.merge!({ :total => { :gender => [], :status => [] }})
    init_array!(campus_info[:total][:gender], 0, gender_max, 0)
    init_array!(campus_info[:total][:status], 0, reg_max, 0)
    
    
    event.registrations.each do |registration|
      registration.person.assignments.each do |assignment|
        
        campus_info[assignment.campus.id][:gender][registration.person.gender_id] += 1
        
        campus_info[assignment.campus.id][:status][registration.status_id] += 1
        
      end
      
      campus_info[:total][:gender][registration.person.gender_id] += 1

      campus_info[:total][:status][registration.status_id] += 1
    end
  
    campus_info
  end

end
