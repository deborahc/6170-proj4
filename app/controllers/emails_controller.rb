class EmailsController < ApplicationController

	def new
		@email = Email.new
	end

	def create
		@email = Email.new(email_params)
		if @email.save
			@application = UropApplication.find(params[:urop_application_id])
			@title = @application.posting.title
			@message = email_params[:message]
			UserMailer.send_reply(current_user,@application.student,@title,@message)
			flash[:notice] = "Email was sent."
			redirect_to supervisor_application_index_path
		else
			flash[:notice] = "Email was not sent. Please try again."
			redirect_to supervisor_application_index_path
		end
	end


	private
	def email_params
		params.require(:email).permit(:subject,:message)
	end

end
