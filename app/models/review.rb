class Review < ActiveRecord::Base
	belongs_to :student
	belongs_to :supervisor
	validates :supervisor_rating, :presence => true
	validates :time_commitment, :presence => true
	validates :work_description, :presence => true
	validates :anonymous, :presence =>true
end
