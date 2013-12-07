class UserMailer < ActionMailer::Base
  default from: "postmaster@sandbox1152.mailgun.org"
  require 'rest_client'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mail.subject
  #
  API_KEY = "key-3uo93u-1a2plh8mazdwgak96m7bzl5f2"
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/sandbox1152.mailgun.org"

  def welcome_email(user)
    RestClient.post API_URL+"/messages",
      :from => "postmaster@sandbox1152.mailgun.org",
      :to => user.email,
      :subject => "Welcome to Urop.io",
      :text => "Thanks for signing up"
  end

  def send_request(from,to,title,message)
    RestClient.post API_URL+"/messages",
      :from => from.email,
      :to => to.email,
      :subject => "UROP Application for "+title+" from "+from.first_name+" "+from.last_name,
      :text => message
  end

  # called when supervisors want to send an email to the applicant
  def send_reply(from,to,title,message)
    RestClient.post API_URL+"/messages",
      :from => from.email,
      :to => to.email,
      :subject => "Follow Up: UROP Application for "+title,
      :text => message
  end

end
