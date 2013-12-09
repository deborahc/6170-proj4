# Class representation of UROP Application
class UropApplication < ActiveRecord::Base
	# UROP Application model associations
	belongs_to :student
	belongs_to :posting
	has_many :supervisors, through: :postings,  dependent: :destroy

	# Returns whether a UROP Application with given posting id and user id exists
	def self.exists?(posting_id, user_id)
		UropApplication.where(:posting_id=>posting_id,:student_id=>user_id).exists? 
	end
end
