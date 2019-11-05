class HubsController < ApplicationController
  def index
    @hubs = Hub.all
  end

  def show
    @hub = Hub.new
  end
end
