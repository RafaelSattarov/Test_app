module EventsHelper

 def has_day?(day, event)
   event.start_at.strftime("%Y-%m-%d")<=day.to_s and
   event.end_at.strftime("%Y-%m-%d")>=day.to_s
 end

end
