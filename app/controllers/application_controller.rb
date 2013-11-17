class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def new
		@application = Application.new
	end

	def create
		@application = Application.new(application_params)
		#@application.posting = #current posting
		response_to do |format|
			if @menu.save
				format.html {}
			else
			end
	end

end