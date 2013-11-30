class UropApplicationsController < ApplicationController
	before_action :set_urop_application, only: [:destroy]
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
				#Send a copy of the message to the supervisor's email address
				@message = application_params[:message]
				@title = @urop_application.posting.title
				UserMailer.send_request(current_user,@urop_application.posting.supervisor,@message,@title)
				format.html { redirect_to postings_path }
			else
				format.html { redirect_to postings_path }
			end
		end
	end

	def destroy
		@urop_application.destroy
		respond_to do |format|
			format.html { redirect_to urop_applications_path }
			format.json { head :no_content }
	    end
	end

	def supervisor_application_index
		@urop_applications = current_user.urop_applications
	end


	def student_application_index
		@urop_applications = current_user.urop_applications
	end

	def email
		@application = UropApplication.find(params[:application])
		@title = @application.posting.title
		@message = params['message']
		puts "hello"
		puts @message
		UserMailer.send_reply(current_user,@application.student,@title,@message)
	end

	private

	def set_urop_application
      @urop_application = UropApplication.find(params[:id])
    end

	def application_params
		params.require(:urop_application).permit(:message, :supervisor_id, :posting_id, :student_id, :status)
	end

    # Only users can create applications
    def can_create
      unless current_user.type == 'Student'
          redirect_to urop_applications_path, :notice => "You can't access this page"
      end
    end


end
