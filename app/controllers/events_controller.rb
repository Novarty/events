class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose_decorated :events, -> { Event.all }
  expose_decorated :event

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    event.user = current_user
    event.save
    respond_with event
  end

  def update
    event.update(event_params)
    respond_with event
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :start_date,
      :finish_date
    )
  end
end
