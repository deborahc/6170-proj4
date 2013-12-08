require 'test_helper'

class EmailTest < ActiveSupport::TestCase
	# Tests the attributes of the Email class for correctness
	def test_email_attributes
		assert_equal(emails(:one).subject, "Interest in UROP Posting", "Check email subject attribute")
		assert_equal(emails(:one).message, "Hello Professor, I am interested in your UROP posting on urop.io. I have attached my resume in this email. Please let me know if this opportunity is still available.", "Check email message attribute")
		assert_equal(emails(:two).subject, "Interest in UROP Posting", "Check email subject attribute")
		assert_equal(emails(:two).message, "I am interested in your UROP posting on urop.io. I have attached my resume in this email. Please let me know if this opportunity is still available.", "Check email message attribute")
		assert_equal(emails(:three).subject, "Interest in UROP Posting", "Check email subject attribute")
		assert_equal(emails(:three).message, "Hello Professor, I am interested in your UROP posting on urop.io. Please let me know if this opportunity is still available.", "Check email message attribute")
		assert_equal(emails(:four).subject, "Interest in UROP Posting", "Check email subject attribute")
		assert_equal(emails(:four).message, "Hello Professor, I am interested in your UROP posting on urop.io. I have attached my resume in this email.", "Check email message attribute")
	end
end