class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]

	def new
	end

	def create
  		user = User.find_by_email(params[:email])
  		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "Logged in"

			
			redirect_to users_path  
		else
			logger.info 'incorrect'
			redirect_to :back, :notice => "Invalid email or password"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Successfully logged out"
	end
end
