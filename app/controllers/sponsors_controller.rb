class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  before_action :get_event

  def index
    @sponsors = @event.sponsors
  end

  def new
    @sponsor = @event.sponsors.build
  end

  def create
    @sponsor = @event.sponsors.build(sponsor_params)

    if @sponsor.save
      redirect_to Event.find(@sponsor.event_id)
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
      redirect_to event_sponsors_path
    else
      render 'edit'
    end
  end

  def destroy
    @sponsor.destroy

    redirect_to event_sponsors_path
  end

  private
  def get_event
    @event = Event.find(params[:event_id])
  end

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:logo, :name, :website, :status, :event_id)
  end
end
