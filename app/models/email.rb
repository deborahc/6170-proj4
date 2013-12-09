# Email class representation
class Email < ActiveRecord::Base
	validates :subject, :presence => true
	validates :message, :presence => true
end
