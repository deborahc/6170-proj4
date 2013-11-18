class UropApplicationsController < ApplicationController

	def new
		@urop_application = UropApplication.new
		@posting = Posting.find_by(params[:id])
	end

	def show
	end

	def create
		@urop_application = UropApplication.new(application_params)
		@posting = Posting.find_by(params[:id])
		@urop_application.student = current_user
		@urop_application.posting = @posting
		respond_to do |format|
			if @urop_application.save
				format.html { redirect_to postings_path }
			else
				format.html { redirect_to postings_path }
			end
		end
	end

	def student_application
		if current_user.type == "Supervisor"
			@postings = current_user.postings
		else
			redirect_to user_path(current_user.id)
		end
	end

	def view_application
		if current_user.type = "Student"
			@urop_applications = current_user.urop_applications
		else
			redirect_to user_path(current_user.id)
		end
	end

	private

	def application_params
		params.require(:urop_application).permit(:message)
	end
end
