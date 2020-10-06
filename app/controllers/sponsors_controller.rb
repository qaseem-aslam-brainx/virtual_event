class SponsorsController < ApplicationController
  before_action :set_event
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  def index
    @sponsors = @event.sponsors
  end

  def new
    @sponsor = @event.sponsors.build
  end

  def create
    @sponsor = @event.sponsors.build(sponsor_params)

    if @sponsor.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to event_sponsors_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @sponsor.destroy

    redirect_to event_sponsors_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_sponsor
    @sponsor = @event.sponsors.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:logo, :name, :website, :status)
  end
end
