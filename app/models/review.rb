class Review < ActiveRecord::Base
	belongs_to :student
	belongs_to :supervisor
	validates :overall_rating, :presence => true
	validates :supervisor_rating, :presence => true
	validates :time_commitment, :presence => true
end
