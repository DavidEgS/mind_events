class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :venue_options, only: [:edit, :new]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
    @venue_options = Venue.all.map { |v| [v.name, v.id] }
    authorize @event
  end

  def create
    @event = Event.new(event_params)
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
    @event.update(event_params)
    authorize @event
  end

  def destroy
    @event.destroy

    # no need for app/views/events/destroy.html.erb
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:venue_id, :date, :activity, :capacity)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def venue_options
    @venue_options = Venue.all.map { |v| [v.name, v.id] }
  end
end
