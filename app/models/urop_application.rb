class UropApplication < ActiveRecord::Base
	belongs_to :student
	belongs_to :posting
	has_many :supervisors, through: :postings
end
