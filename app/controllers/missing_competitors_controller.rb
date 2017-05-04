class MissingCompetitorsController < ApplicationController

	def create
		@ring = Ring.find(params[:ring_id])
		@competitor = @ring.missing_competitors.create(competitor_params)

		redirect_to rings_path
	end

	def destroy
		@ring = Ring.find(params[:ring_id])
		@competitor = @ring.missing_competitors.find(params[:id])
		@competitor.destroy

		redirect_to rings_path
	end


	private
		def competitor_params
			params.require(:missing_competitor).permit(:ring_id, :name)
		end



end
