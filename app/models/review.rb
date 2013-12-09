# Review class representation
class Review < ActiveRecord::Base
	# Review model associations
	belongs_to :student
	belongs_to :supervisor

	# Review attribute validations
	validates :supervisor_id, :presence => true
	validates :supervisor_rating, :presence => true
	validates :time_commitment, :presence => true
	validates :work_description, :presence => true
	validates :anonymous, :inclusion => {:in => [true, false]}

	# Search method to allow searching on all reviews page
	def self.search(search)
		if search
			reviews = Array.new
			split_word = search.split(" ")
			if split_word[1].nil?
				split_word[0].delete(" ") unless split_word[0].nil?
				Supervisor.where("first_name like ? or last_name like ? ", "%#{split_word[0]}%", "%#{split_word[0]}%").each do |supervisor|
					supervisor.reviews.each do |review|
						reviews.push(review)
					end
				end
			else
				if !split_word[2].nil?
					return reviews
				else
					Supervisor.where("first_name like? or last_name like ?", "%#{split_word[1]}%", "%#{split_word[1]}%").each do |supervisor|
						supervisor.reviews.each do |review|
							reviews.push(review)
						end
					end
				end
			end
			return reviews
		else
			scoped
		end
	end
end
