class Supervisor < User
	has_many :postings
	has_many :urop_applications, through: :postings
end
