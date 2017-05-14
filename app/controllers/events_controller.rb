class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :map]

  def index
    puts "yoooooooo"+params[:location].inspect
    @location = params[:location]
    @events = Event.where(location: params[:location])
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
    @event.latitude = Geokit::Geocoders::GoogleGeocoder.geocode(params[:event][:streetaddress] + params[:event][:city] + params[:event][:state]).lat
    @event.longitude = Geokit::Geocoders::GoogleGeocoder.geocode(params[:event][:streetaddress] + params[:event][:city] + params[:event][:state]).lng
    if @event.save
      flash[:notice] = "Your event was created!"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your event."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.user_id == current_user.id
    else
      flash[:notice] = "You do not have access to that page."
      redirect_to event_path(@event.id)
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.latitude = Geokit::Geocoders::GoogleGeocoder.geocode(params[:event][:streetaddress] + params[:event][:city] + params[:event][:state]).lat
    @event.longitude = Geokit::Geocoders::GoogleGeocoder.geocode(params[:event][:streetaddress] + params[:event][:city] + params[:event][:state]).lng
    if @event.update(event_params)
      flash[:notice] = "Your event has been updated."
      redirect_to event_path(@event.id)
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

  def map
    @events = Event.where('enddate >= ?', DateTime.now)
  end

  private
  # strong params
  def event_params
    params.require(:event).permit(:name, :description, :startdate, :enddate, :location, :streetaddress, :city, :state, :zip, :cost, :image)
  end

end
