class HubsController < ApplicationController
  def index
    @search = params[:search]
    if @search.present?
      sql_query = "city ILIKE :search OR name ILIKE :search"
      @hubs = Hub.where(sql_query, search: "%#{@search}%")
    else
      @hubs = Hub.all
    end
  end

  def show
    @studios = Studio.geocoded #returns studios with coordinates
    @hub = Hub.find(params[:id])
    @cevents = @hub.events.group_by { |e| e.start_time.to_date }
    @event = Event.new
    @studios = Studio.where(hub: @hub)
    @users = User.where(hub: @hub)
    @markers = @studios.map do |studio|
      {
        lat: studio.latitude,
        lng: studio.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { studio: studio }),
        image_url: helpers.asset_url("lotus_icon.png")
      }
    end
  end
end
