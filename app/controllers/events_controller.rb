class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_url(@event), notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_url(@event), notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @event.destroy

    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :address, :datetime, :description)
    end
end
