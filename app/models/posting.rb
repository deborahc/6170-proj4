class Posting < ActiveRecord::Base
	has_many :urop_applications
	belongs_to :supervisors
end
