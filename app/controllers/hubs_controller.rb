class HubsController < ApplicationController
  def index
    @search = params[:search]
    if @search.present?
      @hubs = Hub.where("city ILIKE ?", "%#{@search}%")
    else
      @hubs = Hub.all
    end
  end

  def show
    @studios = Studio.geocoded #returns studios with coordinates
    @hub = Hub.find(params[:id])
    @event = Event.new
    @studios = Studio.where(hub: @hub)
    @users = User.where(hub: @hub)
    @markers = @studios.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { studio: studio })
      }
    end
  end
end
