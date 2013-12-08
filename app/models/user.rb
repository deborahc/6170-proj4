class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :resume

	#Uncomment to run locally
	#:storage => :s3,
	#:s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
 	# # Authenticated read prevents access to resumes by changing the URL
 	# # Authentication to s3 file expires after 1 hour
 	#:s3_permissions => :authenticated_read
    
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :password, :presence => true
	validates :password_confirmation, :presence => true, :on => :create
	validates :email, :presence => true, :uniqueness => true

end

