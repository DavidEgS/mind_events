class EventUsersController < ApplicationController
  before_action :set_event_user, only: [:update, :destroy]

  def new
    @event_user = EventUser.new
  end

  def create
    @event_user = EventUser.new(event_id: params[:event_id])
    @event_user.user = current_user

    if @event_user.save
      redirect_to :root
    else
      redirect_back(fallback_location: "/")
    end
    authorize @event_user
  end

  def update
    @event_user.update(eventuser_params)
    authorize @event_user
  end

  def destroy
    @event_user.destroy
    redirect_to events_path
    authorize @event_user
  end

  private

  def eventuser_params
    params.require(:event_user).permit(:event_id, :user_id, :attended)
  end

  def set_event_user
    @event_user = EventUser.find(params[:id])
  end
end
