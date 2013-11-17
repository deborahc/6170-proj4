class UropApplicationsController < ApplicationController

	def new
		@urop_application = UropApplication.new
	end

	def show
	end

	def create
		@urop_application = UropApplication.new(application_params)
		@urop_application.student = current_user
		@urop_application.posting = params[:id]
		respond_to do |format|
			if @urop_application.save
				format.html { redirect_to postings_path }
			else
				format.html { redirect_to postings_path }
			end
		end
	end

	private

	def application_params
		params.require(:urop_application).permit(:message)
	end
end
