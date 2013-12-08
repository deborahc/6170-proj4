require 'test_helper'

class UropApplicationTest < ActiveSupport::TestCase
	# Tests the attributes and associations of the UROP application class for correctness
	def test_urop_application_attributes
		assert_equal(urop_applications(:one).posting_id, 1, "Check posting id attribute and association")
		assert_equal(urop_applications(:one).student_id, 2, "Check student id attribute and association")
		assert_equal(urop_applications(:one).message, "Please see my attach resume.", "Check message attribute")
		assert_equal(urop_applications(:one).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(urop_applications(:one).status, "Submitted", "Check status attribute")

		assert_equal(urop_applications(:two).posting_id, 1, "Check posting id attribute and association")
		assert_equal(urop_applications(:two).student_id, 3, "Check student id attribute and association")
		assert_equal(urop_applications(:two).message, "Please see my attach resume.", "Check message attribute")
		assert_equal(urop_applications(:two).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(urop_applications(:two).status, "Submitted", "Check status attribute")
		
		assert_equal(urop_applications(:three).posting_id, 4, "Check posting id attribute and association")
		assert_equal(urop_applications(:three).student_id, 5, "Check student id attribute and association")
		assert_equal(urop_applications(:three).message, "Please see my attach resume.", "Check message attribute")
		assert_equal(urop_applications(:three).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(urop_applications(:three).status, "Submitted", "Check status attribute")
		
		assert_equal(urop_applications(:four).posting_id, 5, "Check posting id attribute and association")
		assert_equal(urop_applications(:four).student_id, 6, "Check student id attribute and association")
		assert_equal(urop_applications(:four).message, "Please see my attach resume.", "Check message attribute")
		assert_equal(urop_applications(:four).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(urop_applications(:four).status, "Submitted", "Check status attribute")
	end
end