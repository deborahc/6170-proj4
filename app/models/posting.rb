class Posting < ActiveRecord::Base
	has_many :urop_applications
	belongs_to :supervisor
	
	validates :title, :presence => true

	validates :description, :presence => true
	validates :skills, :presence => true
	validates :funding_type, :presence => true


	# Method to allow searching by description on all postings page
	def self.search(search)
  		if search
    		where('description LIKE ?', "%#{search}%")
  		else
    		scoped
    	end
  	end
end
