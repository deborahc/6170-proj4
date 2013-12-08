class Posting < ActiveRecord::Base
	has_many :urop_applications
	belongs_to :supervisor, dependent: :destroy
	has_many :reviews
	
	validates :title, :presence => true
	validates :description, :presence => true
	validates :skills, :presence => true
	validates :funding_type, :presence => true


	# Method to allow searching on all postings page
	def self.search(search)
  		if search
    		where(['title LIKE ? OR description LIKE ? OR skills LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  		else
    		scoped
    	end
  	end

	# Search by title
	def self.title_search(search)
		if search
			where('title LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	# Search by description
	def self.description_search(search)
		if search
			where('description LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	# Search by skills
	def self.skill_search(search)
		if search
			where('skills LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

end
