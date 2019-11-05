class EventBookingsController < ApplicationController
  def create
    @booking = EventBooking.new
    @booking.user = current_user
    @event = Event.find(params[:event_id])
    @booking.event = @event
    if @booking.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def destroy
  end
end
