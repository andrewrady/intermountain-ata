class HotelsController < ApplicationController
	before_action :authenticate_user!

	def create
		@event = Event.find(params[:event_id])
		@hotel = @event.hotels.create(hotel_params)
		redirect_to event_path(@event)
	end

	def edit
		@event = Event.find(params[:event_id])
		@hotel = @event.hotels.find(params[:id])
  end

  def update
		@event = Event.find(params[:event_id])
		@hotel = @event.hotels.find(params[:id])

		if @hotel.update(hotel_params)
			redirect_to event_path(@event)
		else
			render 'edit'
		end		

	end

  def destroy
		@event = Event.find(params[:event_id])
		@hotel = @event.hotels.find(params[:id])
		@hotel.destroy

		redirect_to event_path(@event)
  end

	private	
		def hotel_params
			params.require(:hotel).permit(:name, :dates, :cost, :link, :number, :address)
		end
end
