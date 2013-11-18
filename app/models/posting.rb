class Posting < ActiveRecord::Base
	has_many :urop_applications
	belongs_to :supervisor

	def self.search(search)
  		if search
    		where('description LIKE ?', "%#{search}%")
  		else
    		scoped
    	end
  	end
end
