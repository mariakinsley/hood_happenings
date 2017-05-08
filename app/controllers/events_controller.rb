class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = "Your event was created!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your event."
      render :new
    end
  end


  # strong params
  def event_params
    params.require(:event).permit(:name, :description, :startdate, :enddate, :location, :cost, :image)
  end

end
