class EventUsersController < ApplicationController

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

  private

  def eventuser_params
    params.require(:event_user).permit(:event_id, :user_id)
  end
end
