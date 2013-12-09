# User class representation
class Student < User
	# User model associations
	has_many :urop_applications,  dependent: :destroy
	has_many :reviews
end
