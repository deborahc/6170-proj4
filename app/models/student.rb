class Student < User
	has_many :urop_applications,  dependent: :destroy

	has_many :reviews
end
