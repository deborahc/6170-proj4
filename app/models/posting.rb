class Posting < ActiveRecord::Base
	has_many :urop_applications
<<<<<<< HEAD
	belongs_to :supervisor, dependent: :destroy
	has_many :reviews
=======
	belongs_to :supervisor

>>>>>>> master
	
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
