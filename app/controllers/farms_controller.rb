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

    respond_to do |format|
      if @farm.save
        format.html { redirect_to @farm, notice: 'Farm was successfully created.' }
        format.json { render :show, status: :created, location: @farm }
      else
        format.html { render :new }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @farm.update(farm_params)
        format.html { redirect_to @farm, notice: 'Farm was successfully updated.' }
        format.json { render :show, status: :ok, location: @farm }
      else
        format.html { render :edit }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @farm.destroy
    respond_to do |format|
      format.html { redirect_to farms_url, notice: 'Farm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_farm
      @farm = Farm.find(params[:id])
    end


    def farm_params
      params.require(:farm).permit(:name, :address, :website, :latitude, :longitude, :schedule)
    end
end
