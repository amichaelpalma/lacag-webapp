class EventsController < ApplicationController

  before_action :set_events, only: [:edit, :update, :show, :destroy]

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


  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Item successfully updated."
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @event.destroy
    flash[:notice] = "Event was successfully deleted."
    redirect_to events_path
  end



  private

  def event_params
    params.require(:event).permit(:title, :subtitle, :tag, :details)
  end

  def set_events
    @event = Event.find(params[:id])
  end

end