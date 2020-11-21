class ReportsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    authorize @event
    respond_to do |format|
      format.html
      format.csv { send_data @event.instance_csv }
    end
  end
end
