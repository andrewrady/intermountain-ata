class RingsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @ring = Ring.all.where(:status => true).reorder('ring_number ASC')
		@upcoming = Ring.all.where(:status =>false).reorder('ring_number ASC')
    @competitor = MissingCompetitor.all
  end

  def show
    #code
  end

  def new
    @ring = Ring.new
  end

  def edit
    @ring = Ring.find(params[:id])
    @competitor = MissingCompetitor.new
  end

  def create
    @ring = Ring.new(ring_params)

    @ring.save
    redirect_to rings_path
  end

  def update
    @ring = Ring.find(params[:id])

    if @ring.update(ring_params)
      redirect_to rings_path
    else
      render 'edit'
    end
  end

  def destroy
    @ring = Ring.find(params[:id])
    @ring.destroy

    redirect_to rings_path
  end

	def change_status
		@upcoming = Ring.find(params[:ring_id])
		@ring = Ring.where("ring_number = ?", @upcoming.ring_number)

		@old = @ring.first
		@new = @ring.second

		#remove and alter rings
		@old.destroy
		@new.status = true
		@new.save

		redirect_to rings_path

	end


  private
    def ring_params
      params.require(:ring).permit(:ring_number, :ring_rank, :ring_age, :ring_gender, :division, :status)
      #code
    end
end
