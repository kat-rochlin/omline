class EventBookingsController < ApplicationController
  def create
    @booking = EventBooking.new
    @booking.user = current_user
    @event = Event.find(params[:event_id])
    @booking.event = @event
    if @booking.save
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'events/show' }
        format.js
      end
    end
  end

  def destroy
  end
end
