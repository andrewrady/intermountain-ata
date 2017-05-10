class HotelsController < ApplicationController
	def create
		@event = Event.find(params[:event_id])
		@hotel = @event.hotels.create(hotel_params)
		redirect_to event_path(@event)
	end

	private
		def hotel_params
			params.require(:hotel).permit(:name, :dates, :cost, :link, :number, :address)
		end

end
