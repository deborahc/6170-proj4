# User class representation
class Supervisor < User
	# User model associations
	has_many :reviews
	has_many :postings
	has_many :urop_applications, through: :postings


	# Retrieves the supervisor overall rating
	def self.get_rating(id)
		supervisor = Supervisor.find(id)
		return supervisor.reviews.average("overall_rating")
	end
end
