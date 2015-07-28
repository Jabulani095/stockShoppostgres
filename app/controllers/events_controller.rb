class EventsController < ApplicationController

  def index
  @event = Event.sorted
  end

  def show
  @event = Event.find(params[:id])
  end

  def new
  @event = Event.new({:name => "event name"})
  
  end

  def create
   @event = Event.new(event_params)
   if @event.save
   load_eventId
   @username = params[:name]
   session[:eventId] = @event.id
   redirect_to(:action => 'index', :id => @event.id, :First_name =>  @username)
   else
   render('new')
   end
  end
  
  def edit
  @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
	flash[:notice] = "event updated successfully"
     redirect_to(:action => 'show', :id => @event.id)
    else
      redirect_to users_path, :alert => "Unable to update event."
    end
  end

  def delete
  @event = AdminUser.find(params[:id])
    @event.destroy
	flash[:notice] = "event deleted"
    redirect_to users_path, :notice => "event deleted."
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name, :Location, :Date)
  end
  
  def load_eventId
    @eventIds = EventsId.new({:userId => session[:user_id], :eventId => @event.id})
   if @eventIds.save
   flash[:notice] = "event created successfully"
   end
  end
end
