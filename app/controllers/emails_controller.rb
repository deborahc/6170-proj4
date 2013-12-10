# Email Controller
class EmailsController < ApplicationController
	# Initializes new Email
	def new
		@email = Email.new
	end

	# Fills email with valid attributes
	def create
		@email = Email.new(email_params)
		if @email.save
			@application = UropApplication.find(params[:urop_application_id])
			@title = @application.posting.title
			@message = email_params[:message]
			UserMailer.send_reply(current_user,@application.student,@title,@message)
			flash[:notice] = "Email was sent."
			redirect_to supervisor_application_show_path(@application.posting.id)
		else
			flash[:notice] = "Email was not sent. Please try again."
			redirect_to supervisor_application_show_path(@application.posting.id)
		end
	end


	private
	# Whitelists only subject and message parameters into params
	def email_params
		params.require(:email).permit(:subject,:message)
	end

end
