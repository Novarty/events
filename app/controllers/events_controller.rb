class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose_decorated :events, -> { init_events }
  expose_decorated :event

  def index; end

  def show; end

  def new; end

  def create
    event.user = current_user
    event.save
    respond_with event
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :start_date,
      :finish_date,
      :all_tags,
      :photo
    )
  end

  def init_events
    events = Event.all
    events = Event.tagged_with(params[:tag]) if params[:tag]
    events #returns
  end
end
