class Supervisor < User
	has_many :reviews
	has_many :postings
	has_many :urop_applications, through: :postings
end
