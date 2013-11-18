class UropApplicationsController < ApplicationController

	before_action :can_create, only: [:new, :create]

	def index
		if current_user.type == 'Student'
			redirect_to student_application_index_path
		elsif current_user.type == 'Supervisor'
			redirect_to supervisor_application_index_path
		else 
			redirect_to user_path(current_user.id)
		end
	end

	def new
		@urop_application = UropApplication.new
	end

	def show
	end

	def create
		logger.info application_params
		@urop_application = UropApplication.new(application_params)
		respond_to do |format|
			if @urop_application.save
				format.html { redirect_to postings_path }
			else
				format.html { redirect_to postings_path }
			end
		end
	end

	def supervisor_application_index
		@urop_applications = current_user.urop_applications
	end


	def student_application_index
		@urop_applications = current_user.urop_applications
	end

	private

	def application_params
		params.require(:urop_application).permit(:message, :supervisor_id, :posting_id, :student_id)
	end

    # Only users can create applications
    def can_create
      unless current_user.type == 'Student'
          redirect_to urop_applications_path, :notice => "You can't access this page"
      end
    end


end
