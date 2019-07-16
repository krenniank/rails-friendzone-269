class EventsController < ApplicationController
  def index
    @events = Event.all

    policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end
end
