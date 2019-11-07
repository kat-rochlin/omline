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
    @studios = Studio.all
    @users = User.where(hub: @hub)

    @markers = @studios.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude
      }
    end
  end
end
