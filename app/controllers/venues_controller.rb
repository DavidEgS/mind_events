class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :destroy]
  def index
    @venues = policy_scope(Venue)
  end

  def show
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    authorize @venue

    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @venue.update(venue_params)
    authorize @venue
  end

  def destroy
    @venue.destroy

    # no need for app/views/venues/destroy.html.erb
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address_line_one, :address_line_two, :town, :county, :postcode)
  end

  def set_venue
    @venue = Venue.find(params[:id])
    authorize @venue
  end
end
