class EventController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy,:index]
#new event render
  def new
    @event = Event.new 
    @event.pictures.build
  end
#attndeing method for user
  def attend
    @event = Event.find_by(id: params[:id])
    @event.attendees << current_user
    redirect_to current_user
  end
#show all event 
  def index
    @upcoming_events= Event.upcoming.all
    @past_events = Event.past.all
    if params[:user_id].present?
      @events = Event.where(user_id: params[:user_id])
    else
      @events = Event.where(user_id: current_user.id)
    end 
    authorize @events
  end  
#craete new event and save
  def create
    @event = current_user.events.build(event_params)
    authorize @event
    if @event.save!
      @event.attendees << current_user  
      flash[:success] = "Event created successfully...!!!!!!!!!!"
      redirect_to current_user
    else
      flash[:notice] = "Event is not crrated plase fill the vaule...!!!!!!!!!!"
      redirect_to root_url
    end
  end
#destory event
  def destroy
    @event = Event.find_by(params[:event_id])
    if @event.destroy
      authorize @event
      flash[:success] = "Event Deleted"
      redirect_back(fallback_location: root_url)
    else
      flash[:notice] = "event is not deteled plzz try again!!!!"
      redirect_to root_path
    end
  end
#update event
  def update
    @event = Event.find(params[:id])
    authorize @event
    if@event.update(event_params)
        redirect_back(fallback_location: root_url)
    else
      render :edit
    end
  end
#private method for event params
  private
  def event_params
    params.require(:event).permit(:date, :location, :title, :description, :user_id , pictures_attributes: :picture)
  end

end