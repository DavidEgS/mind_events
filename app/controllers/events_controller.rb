class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
    @venue_options = Venue.all.map{ |v| [v.address_one, v.id] }
    authorize @event
  end

  def create
    date = params[:date].to_datetime
    @event = Event.new(date: date)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    @event.update(params[event_params])
    authorize @event
  end

  def destroy
    @event.destroy

    # no need for app/views/events/destroy.html.erb
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:venue_id, :date)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
