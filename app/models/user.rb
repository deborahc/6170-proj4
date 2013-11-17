class User < ActiveRecord::Base
	has_secure_password


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

