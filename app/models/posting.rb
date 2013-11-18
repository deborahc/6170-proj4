class Posting < ActiveRecord::Base
	has_mamy :urop_applications
	belongs_to :supervisor
end
