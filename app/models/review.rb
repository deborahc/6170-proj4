class Review < ActiveRecord::Base
	belongs_to :student
	belongs_to :supervisor
	belongs_to :posting
	validates :overall_rating, :presence => true
	validates :supervisor_rating, :presence => true
	validates :time_commitment, :presence => true
	validates :recommended, :presence => true
	validates :reflection, :presence => true
end
