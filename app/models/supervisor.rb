class Supervisor < User
	has_many :reviews
	has_many :postings, dependent: :destroy
	has_many :urop_applications, through: :postings
end
