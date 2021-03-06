require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
	# Tests the attributes and associations of the review class for correctness
	def test_urop_application_attributes
		assert_equal(reviews(:one).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(reviews(:one).student_id, 2, "Check student id attribute and association")
		assert_equal(reviews(:one).reflection, "Great research opportunity. Time commitment was reasonable and received great mentorship. Highly recommended.", "Check reflection attribute")
		assert_equal(reviews(:one).overall_rating, 10, "Check overall rating attribute")
		assert_equal(reviews(:one).supervisor_rating, "10", "Check supervisor rating attribute and association")
		assert_equal(reviews(:one).time_commitment, 12, "Check time commitment attribute")
		assert_equal(reviews(:one).expected, "Yes", "Check expected attribute")
		assert_equal(reviews(:one).work_description, "Coding.", "Check work description attribute")
		assert_equal(reviews(:one).anonymous, false, "Check anonymous attribute")

		assert_equal(reviews(:two).supervisor_id, 4, "Check supervisor id attribute and association")
		assert_equal(reviews(:two).student_id, 3, "Check student id attribute and association")
		assert_equal(reviews(:two).reflection, "Thoroughly enjoyed this research opportunity.", "Check reflection attribute")
		assert_equal(reviews(:two).overall_rating, 9, "Check overall rating attribute")
		assert_equal(reviews(:two).supervisor_rating, "10", "Check supervisor rating attribute and association")
		assert_equal(reviews(:two).time_commitment, 12, "Check time commitment attribute")
		assert_equal(reviews(:two).expected, "Yes", "Check expected attribute")
		assert_equal(reviews(:two).work_description, "Coding.", "Check work description attribute")
		assert_equal(reviews(:two).anonymous, false, "Check anonymous attribute")

		assert_equal(reviews(:three).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(reviews(:three).student_id, 5, "Check student id attribute and association")
		assert_equal(reviews(:three).reflection, "Great opportunity.", "Check reflection attribute")
		assert_equal(reviews(:three).overall_rating, 10, "Check overall rating attribute")
		assert_equal(reviews(:three).supervisor_rating, "9", "Check supervisor rating attribute and association")
		assert_equal(reviews(:three).time_commitment, 10, "Check time commitment attribute")
		assert_equal(reviews(:three).expected, "Yes", "Check expected attribute")
		assert_equal(reviews(:three).work_description, "Coding.", "Check work description attribute")
		assert_equal(reviews(:three).anonymous, false, "Check anonymous attribute")

		assert_equal(reviews(:four).supervisor_id, 7, "Check supervisor id attribute and association")
		assert_equal(reviews(:four).student_id, 6, "Check student id attribute and association")
		assert_equal(reviews(:four).reflection, "Highly recommended.", "Check reflection attribute")
		assert_equal(reviews(:four).overall_rating, 9, "Check overall rating attribute")
		assert_equal(reviews(:four).supervisor_rating, "9", "Check supervisor rating attribute and association")
		assert_equal(reviews(:four).time_commitment, 10, "Check time commitment attribute")
		assert_equal(reviews(:four).expected, "Yes", "Check expected attribute")
		assert_equal(reviews(:four).work_description, "Coding.", "Check work description attribute")
		assert_equal(reviews(:four).anonymous, false, "Check anonymous attribute")
	end
end