class User < ActiveRecord::Base
	has_secure_password



	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :password, :presence => true
	validates :password_confirmation, :presence => true, :on => :create
	validates :email, :presence => true, :uniqueness => true



	# def self.authenticate(email, input_password_digest)
	# 	logger.info input_password_digest
	# 	logger.info 'blah'
	# 	user = find_by_email(email)
	# 	if user && (user.password_digest == input_password_digest)
	# 		user
	# 	else
	# 		nil
	# 	end
	# end


end

