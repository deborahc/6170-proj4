# User class representation
class User < ActiveRecord::Base
	# User has a Rails secure password and resume pdf file
	has_secure_password
	has_attached_file :resume

	# Uncomment to run locally
	# has_attached_file :resume,
	# :storage => :s3,
	# :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
  	# Authenticated read prevents access to resumes by changing the URL
  	# Authentication to s3 file expires after 1 hour
 	# :s3_permissions => :authenticated_read
 	
 	# Validations on User attributes
	validate :resume_is_pdf
	validate :resume_is_smaller_than_four_megabytes
	validates :first_name, :presence => true,
							length: { minimum: 2 },
							length: { maximum: 50}
	validates :last_name, :presence => true,
						  length: { minimum: 2 },
						  length: { maximum: 50}
	validates :password, :presence => true
	validates :password_confirmation, :presence => true,
									  :on => :create
	VALID_EMAIL_REGEX =  /\A[A-Z0-9._%+-]+@mit.edu+\z/i 
	validates :email, :presence => true,
					  :uniqueness => true,
					  format: {with: VALID_EMAIL_REGEX}

	# Sanitize input before save
	#before_save :clean_html

	# Write custom validation method, because paperclip's custom message feature isn't flexible enough
	def resume_is_pdf
		if self.resume?
	  		if !self.resume.content_type.match('application/pdf')
	    		self.errors.add(:resume, "must be a pdf")
	  		end
		end
	end

	# Asserts that the uploaded resume is smaller than 4 megabytes in size
	def resume_is_smaller_than_four_megabytes
		if self.resume?
	  		if self.resume.size > 4.megabytes
	    		self.errors.add(:resume, "must be less than 4 megabytes in size")
	  		end
		end
	end
end

