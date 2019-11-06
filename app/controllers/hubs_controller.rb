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
    @hub = Hub.find(params[:id])
    @event = Event.new
  end
end
