require 'test_helper'

class SupervisorTest < ActiveSupport::TestCase
    # Tests the student attributes of the Student class for correctness
	def test_student_user_attributes
		assert_equal(users(:Deborah).first_name, "Deborah", "Check student first name attribute")
		assert_equal(users(:Deborah).last_name, "Chen", "Check student last name attribute")
		assert_equal(users(:Deborah).email, "deborahc@mit.edu", "Check student email attribute")
		assert_equal(users(:Deborah).major, "Electrical Engineering and Computer Science", "Check student major attribute")
		assert_equal(users(:Deborah).year, "2014", "Check student year attribute")
		assert_equal(users(:Deborah).type, "Student", "Check user type attribute")
	end
end
