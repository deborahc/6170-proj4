class Supervisor < User
	has_many :reviews
	has_many :postings
	has_many :applications, through: :postings
end
