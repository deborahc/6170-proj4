class Supervisor < User
	has_many :reviews
	has_many :postings
	has_many :urop_applications, through: :postings

	def self.get_rating(id)
		supervisor = Supervisor.find(id)
		return supervisor.reviews.average("overall_rating")
	end
end
