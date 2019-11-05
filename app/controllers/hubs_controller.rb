class HubsController < ApplicationController
  def index
    @hubs = Hub.all
  end

  def show
    @hub = Hub.find(params[:id])
    @event = Event.new
  end
end
