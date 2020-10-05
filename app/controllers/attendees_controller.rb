class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  def index
    @attendees = @event.attendees
  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build(attendee_params)

    if @attendee.save
      redirect_to Event.find(@attendee.event_id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to event_attendees_path
    else
      render 'edit'
    end
  end

  def destroy
    @attendee.destroy

    redirect_to event_attendees_path
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :email, :resume, :phone_no, :veteran, :certifications, :education, :reference)
  end
end