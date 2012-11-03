class ApplicationController < ActionController::Base
	include AuthHelper

	protect_from_forgery

	helper_method :current_user, :signed_in?

end
