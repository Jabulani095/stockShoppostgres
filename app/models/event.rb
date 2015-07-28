class Event < ActiveRecord::Base

scope :visible, lambda { where(:visible => true)}
scope :invisible, lambda{ where(:visible => false)}
scope :sorted, lambda{ order("events.name ASC")}
scope :newst_first, lambda{ order("events.created_at DESC")}
scope :search, lambda{|query|
  where(["id = ", "#{query}"])}
  
  
  private
  def add_eventIds
   @eventids = EventsId.new(session[:eventId],session[:user_id])
   if @eventids.save
   flash[:notice] = "eventIds created successfully"
   else
   flash[:notice] = "eventIds Failed"
   end
  end
end
