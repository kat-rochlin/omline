class HubsController < ApplicationController
  def index
    @search = params[:search]
    if @search.present?
      @city = @search[:city]
      @hubs = Hub.where("city ILIKE ?", "%#{@city}%")
    else
      @hubs = Hub.all
    end
  end

  def show
    @hub = Hub.find(params[:id])
  end
end
