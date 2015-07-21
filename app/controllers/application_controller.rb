require 'ostruct'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do

  	if Rails.env.production?
  		@browser_location = request.location
	else
		defaults = {ip: "73.166.222.21",country_code: "US",country_name: "United States",region_code: "TX",region_name: "Texas",city: "Houston",zip_code: '77027',time_zone: "America/Chicago",latitude: 29.743,longitude: -95.445,metro_code: 618}
  		@browser_location = OpenStruct.new(defaults)
  	end
  end
end
