# User class representation
class Supervisor < User
	# User model associations
	has_many :reviews
	has_many :postings
	has_many :urop_applications, through: :postings

	# Retrieves supervisors with reviews that does not have null for overall_rating
	def self.get_not_null(id)
		Supervisor.all.where("")
	end

	# Retrieves the supervisor overall rating
	def self.get_rating(id)
		supervisor = Supervisor.find(id)
		return supervisor.reviews.average("overall_rating")
	end
end
