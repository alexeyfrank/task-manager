module SessionsHelper

	def authenticate_user
		redirect_to login_path unless current_user
	end
end
