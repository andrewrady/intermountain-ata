class RingsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @ring = Ring.all.reorder('ring_number ASC')
  end

  def show
    #code
  end

  def new
    @ring = Ring.new
  end

  def edit
    @ring = Ring.find(params[:id])
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

  private
    def ring_params
      params.require(:ring).permit(:ring_number, :ring_rank, :ring_age, :ring_gender)
      #code
    end
end
