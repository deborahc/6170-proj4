class ErrorsController < ApplicationController
	# Method for throwing 404 Not Found Error
  	def error_404
    	@not_found_path = params[:not_found]
  	end

  	# Method for throwing 500 Internal Server Error
  	def error_500
  		@not_found_path = params[:not_found]
  	end
end