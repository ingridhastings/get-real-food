class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]

  def home
  	if current_user
  		redirect_to dashboard_path
  	end
  end

  def dashboard
  	@user = current_user
  	@farms = @user.farms
  	@reviews = @user.reviews 
  end
end
