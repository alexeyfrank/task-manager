class ApplicationController < ActionController::Base
	include SessionsHelper

	protect_from_forgery

	helper_method :current_user, :logged_in?

	def logged_in?
		current_user
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end



end
