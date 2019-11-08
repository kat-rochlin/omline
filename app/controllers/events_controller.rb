class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def show
    @booking = EventBooking.new
    @event.user = current_user
  end

  def create
    @event = Event.new(event_params)
    @event.hub = Hub.find(params[:hub_id])
    @event.user = current_user
    @studios = Studio.where(hub: @event.hub)
    @users = User.where(hub: @event.hub)
    if @event.save
      redirect_to hub_path(@event.hub)

      @markers = @studios.map do |studio|
        {
          lat: studio.latitude,
          lng: studio.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { studio: studio })
        }
      end
    else
      @failed = true
      render "hubs/show", locals: { :@hub => @event.hub }
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to hubs_path(@hub)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :address, :price, :capacity, :photo)
  end
end
