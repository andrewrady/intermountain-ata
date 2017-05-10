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

	def edit
		@event = Event.find(params[:id])
	end

  def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to root_path
		else
			render 'edit'
		end
  end


  private
    def event_params
      params.require(:event).permit(:name, :description, :date, :location, :status, :schedule)
    end

end
