require 'test_helper'

class SupervisorTest < ActiveSupport::TestCase
	# Tests the supervisor attributes of the User class for correctness
	def test_supervisor_user_attributes
		assert_equal(users(:UnaMay).first_name, "Una-May", "Check supervisor first name attribute")
		assert_equal(users(:UnaMay).last_name, "O'Reilly", "Check supervisor last name attribute")
		assert_equal(users(:UnaMay).email, "unamay@csail.mit.edu", "Check supervisor email attribute")
		assert_equal(users(:UnaMay).department, "Computer Science and Artificial Intelligence Laboratory (CSAIL)", "Check supervisor department attribute")
		assert_equal(users(:UnaMay).lab, "Computer Science and Artificial Intelligence Laboratory (CSAIL)", "Check supervisor lab attribute")
		assert_equal(users(:UnaMay).title, "Principal Research Investigator", "Check supervisor title attribute")
		assert_equal(users(:UnaMay).office, "32-D534", "Check supervisor office attribute")
		assert_equal(users(:UnaMay).type, "Supervisor", "Check user type attribute")
	end
end
