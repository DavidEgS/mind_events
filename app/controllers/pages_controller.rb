class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def privacy
  end

  def register
    @event = Event.find(params[:event_id])
    authorize @event
  end
end
