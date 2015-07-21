class FarmsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    # 

    # Use me for a big map

    if params[:search].present?
      @farms = Farm.search(params[:search]).page(params[:page])
    else
      coords = [@browser_location.latitude, @browser_location.longitude]
      @farms = Farm.near(coords, 100).page(params[:page])
    end

    if @farms.first.present?
      @map_coordinates = [@farms.first.latitude, @farms.first.longitude].join(",")
    else
      coords = [@browser_location.latitude, @browser_location.longitude]
      @map_coordinates = coords.join(",")
    end
    # @farms = Farm.first.nearbys.page(params[:page])

    # 1: find the nearest farm and get nearbys
    # 2: figure out what's wrong with near

    # @farms = Farm.near( "4203 Montrose, Houston TX").page(params[:page])

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

  # @farms = Farm.all
  # @hash = Gmaps4rails.build_markers(@farms) do |farm, marker|
  # marker.lat farm.latitude
  # marker.lng farm.longitude
  

  private
 
    def set_farm
      @farm = Farm.find(params[:id])
    end


    def farm_params
      params.require(:farm).permit(:name, :address, :website, :latitude, :longitude, :schedule)
    end
end
