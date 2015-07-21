class FarmsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_farm, only: [:show, :edit, :update, :destroy]


  def index
    @farms = Farm.search(params[:search])
  end


  def show
    @reviews = @farm.reviews
    if current_user
      @review = Review.new
    end
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
      if @farm.update(farm_params)
        redirect_to @farm, notice: 'Farm was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @farm.destroy
      redirect_to farms_url, notice: 'Farm was successfully destroyed.'
  end

  private
 
    def set_farm
      @farm = Farm.find(params[:id])
    end


    def farm_params
      params.require(:farm).permit(:name, :address, :website, :latitude, :longitude, :schedule)
    end
end
