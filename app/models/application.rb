class Application < ActiveRecord::Base
	before_action :require_login
	helper :all

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_login
		unless current_user
			flash[:error] = "You must be logged in to access this section"
			redirect_to log_in_url
		end
	end

	helper_method :current_user

end
