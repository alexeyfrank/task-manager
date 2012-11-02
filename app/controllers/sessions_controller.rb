class SessionsController < ApplicationController

	def login
	end

	def login_check
		user = User.find_by_email(params[:user][:email])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			flash[:notice] = "You sucessfully logged in!"
			redirect_to root_url
		else
			flash[:error] = "Invalid email or password!"
			render :login
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_url
	end
end
