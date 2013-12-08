class Posting < ActiveRecord::Base
	has_many :urop_applications
	belongs_to :supervisor, dependent: :destroy
	has_many :reviews
	
	validates :title, :presence => true
	validates :description, :presence => true
	validates :skills, :presence => true
	validates :funding_type, :presence => true


	# Method to allow searching on all postings page
	def self.search(search, category)

		if category == '1'
			return self.search_all(search)
		elsif category == '2'
			logger.info(self.search_title(search))

			return self.search_title(search)
		elsif category == '3'
			return self.search_description(search)
		elsif category == '4'
			return self.search_skills(search)
		elsif category == '5'
			return self.search_supervisor(search)
		elsif category =='6'
			return self.search_funding_type(search)
		# return all postings
		else
			scoped
		end

	end

  	def self.search_all(search)
  		 if search
    		where(['title LIKE ? OR description LIKE ? OR skills LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  		else
    		scoped
    	end
  	end

	# Search by title
	def self.search_title(search)
		if search
			where('title LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	# Search by description
	def self.search_description(search)
		if search
			where('description LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	# Search by skills
	def self.search_skills(search)
		if search
			where('skills LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	# Search by supervisor
	def self.search_supervisor(search)
		if search
			postings = Array.new
			if !Supervisor.where("first_name like ? or last_name like ?", "%#{search}%", "%#{search}%").nil?
				Supervisor.where("first_name like ? or last_name like ? ", "%#{search}%", "%#{search}%").each do |supervisor|
					if !supervisor.postings.nil?
						supervisor.postings.each do |posting|
							postings.push(posting)
						end
					end
				end
			end
			return postings
		else
			scoped
		end
	end

	def self.search_funding_type(search)
		if search
			where('funding_type LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end


