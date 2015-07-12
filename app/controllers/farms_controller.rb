class FarmsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    @farms = Farm.all
  end

  def show
  end

  def new
    @farm = Farm.new
  end

  def edit
  end

  def create
    @farm = current_user.farms.new(farm_params)

      if @farm.save
        redirect_to @farm, notice: 'Farm was successfully created.'
      else
        render :new
      end
  end

  def update
    respond_to do |format|
      if @farm.update(farm_params)
        redirect_to @farm, notice: 'Farm was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @farm.destroy
    respond_to do |format|
      redirect_to farms_url, notice: 'Farm was successfully destroyed.'
      head :no_content
    end
  end

  private
    def set_farm
      @farm = Farm.find(params[:id])
    end

    def farm_params
      params.require(:farm).permit(:name, :address, :description, :phone, :website)
    end
end
