class Review < ActiveRecord::Base
	belongs_to :student
	belongs_to :supervisor
	validates :supervisor_rating, :presence => true
	validates :time_commitment, :presence => true
	validates :work_description, :presence => true
	validates :anonymous, :presence =>true

	def self.search(search)
		if search
			reviews = Array.new
			split_word = search.split(" ")
			if split_word[1].nil?
				split_word[0].delete(" ")
				Supervisor.where("first_name like ? or last_name like ? ", "%#{split_word[0]}%", "%#{split_word[0]}%").each do |supervisor|
					if !supervisor.reviews.nil?
						supervisor.reviews.each do |review|
							reviews.push(review)
						end
					end
				end
			else
				if !split_word[2].nil?
					return reviews
				else
					Supervisor.where("first_name like? or last_name like ?", "%#{split_word[1]}%", "%#{split_word[1]}%").each do |supervisor|
						if !supervisor.reviews.nil?
							supervisor.reviews.each do |review|
								reviews.push(review)
							end
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
