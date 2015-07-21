class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
  	@browser_location = request.location
  end
end
