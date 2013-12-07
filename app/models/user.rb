class User < ActiveRecord::Base
	has_secure_password
	# has_attached_file :resume,
	# :storage => :s3,
	# :bucket => 'S3_BUCKET_NAME',
	#     :s3_credentials => {
 #      :access_key_id => 'AWS_ACCESS_KEY_ID',
 #      :secret_access_key => 'AWS_SECRET_ACCESS_KEY'
 #    }

	has_attached_file :resume,
	:storage => :s3,
	:s3_credentials => File.join(Rails.root, 'config', 's3.yml')
     
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :password, :presence => true
	validates :password_confirmation, :presence => true, :on => :create
	validates :email, :presence => true, :uniqueness => true
end

