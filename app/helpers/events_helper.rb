module EventsHelper

  def format_event_start_date(event)

    date = ""

    if event.start != nil && event.end != nil then

      start_date = Date.parse(event.start.to_s)
      end_date = Date.parse(event.end.to_s)

      if end_date < Date.today then
        date = "Over"
      elsif start_date < Date.today then
        date = "Ongoing!"
      else
        date = start_date.strftime("%B %e, %Y")
      end

    else
      date = "Unknown"
    end

    date
  end


end
