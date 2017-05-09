class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = "Your event was created!"
      redirect_to events_path
    else
      flash[:alert] = "There was a problem creating your event."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Your event has been updated."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem updating your event."
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "Your event was deleted."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting your event."
      render :edit
    end
  end

  # strong params
  def event_params
    params.require(:event).permit(:name, :description, :startdate, :enddate, :location, :cost, :image)
  end

end
