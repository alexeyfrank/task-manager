class SessionsController < ApplicationController

	layout "login"

	def new
	end

	def create
		user = User.find_by_email(params[:user][:email])
		if user && user.authenticate(params[:user][:password])
			sign_in user
			flash[:notice] = "You sucessfully logged in!"
			redirect_to root_url
		else
			flash[:error] = "Invalid email or password!"
			render :new
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
