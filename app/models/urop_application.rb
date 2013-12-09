class UropApplication < ActiveRecord::Base
	belongs_to :student
	belongs_to :posting
	has_many :supervisors, through: :postings

	def self.exists?(posting_id,user_id)
		UropApplication.where(:posting_id=>posting_id,:student_id=>user_id).exists? 
	end

end
