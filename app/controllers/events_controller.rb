class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update

  end


  private
    def event_params
      params.require(:event).permit(:name, :description, :date, :location, :schedule)
    end

end
