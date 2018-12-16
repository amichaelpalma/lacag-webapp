class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event successfully added."
      redirect_to events_path
    else
      render 'new'
    end
  end




  private

  def event_params
    params.require(:event).permit(:title, :subtitle, :tag, :details)
  end

end