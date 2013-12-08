require 'test_helper'

class UserTest < ActiveSupport::TestCase
  	# Tests the student attributes of the User class for correctness
	def test_student_user_attributes
		assert_equal(users(:Dwyane).first_name, "Dwyane", "Check student first name attribute")
		assert_equal(users(:Dwyane).last_name, "George", "Check student last name attribute")
		assert_equal(users(:Dwyane).email, "dbgeorge@mit.edu", "Check student email attribute")
		assert_equal(users(:Dwyane).major, "Electrical Engineering and Computer Science", "Check student major attribute")
		assert_equal(users(:Dwyane).year, "2015", "Check student year attribute")
		assert_equal(users(:Dwyane).type, "Student", "Check user type attribute")
	end

	# Tests the supervisor attributes of the User class for correctness
	def test_supervisor_user_attributes
		assert_equal(users(:Jackson).first_name, "Daniel", "Check supervisor first name attribute")
		assert_equal(users(:Jackson).last_name, "Jackson", "Check supervisor last name attribute")
		assert_equal(users(:Jackson).email, "dnj@mit.edu", "Check supervisor email attribute")
		assert_equal(users(:Jackson).department, "Electrical Engineering and Computer Science", "Check supervisor department attribute")
		assert_equal(users(:Jackson).lab, "Computer Science and Artificial Intelligence Laboratory (CSAIL)", "Check supervisor lab attribute")
		assert_equal(users(:Jackson).title, "Professor/MacVicar Fellow", "Check supervisor title attribute")
		assert_equal(users(:Jackson).office, "32-G704", "Check supervisor office attribute")
		assert_equal(users(:Jackson).type, "Supervisor", "Check user type attribute")
	end

	# Tests the security of the user authentication
	def test_user_password_authentication
		user = User.new(first_name: 'david', last_name: "smith", email: "davidsmith@mit.edu", password: '', password_confirmation: 'nomatchpassword')
		assert_equal(user.save, false, "Password required")
		user.password = 'mUc3m00RsqyRe'
		assert_equal(user.save, false, "Confirmation does not match")
		user.password_confirmation = 'mUc3m00RsqyRe'
		assert_equal(user.authenticate('notrightpassword'), false, "Wrong password")
		assert_equal(user.authenticate('mUc3m00RsqyRe').instance_of?(User), true, "Correct password")
		assert_equal(User.find_by(first_name: 'david').try(:authenticate, 'notright').instance_of?(User), false, "Wrong password to authenticate")
	end
end
