class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.new
    @event.event_times.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path(@event)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @event.event_times.build
  end

  def update
    if @event.update(event_params)
      redirect_to events_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :logo, :status, event_times_attributes: [:id, :date, :time_start, :time_end, :_destroy])
  end
end
