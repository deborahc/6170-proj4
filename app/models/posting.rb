class Posting < ActiveRecord::Base
	has_many :urop_applications, dependent: :destroy
	belongs_to :supervisor
	
	validates :title, :presence => true
	validates :description, :presence => true
	validates :skills, :presence => true
	validates :funding_type, :presence => true

	# Method to allow searching on all postings page
	def self.search(search, category)

		if category == '1'
			return self.search_all(search)
		elsif category == '2'
			return self.search_title(search)
		elsif category == '3'
			return self.search_department(search)
		elsif category == '4'
			return self.search_description(search)
		elsif category == '5'
			return self.search_skills(search)
		elsif category == '6'
			return self.search_supervisor(search)
		elsif category =='7'
			return self.search_funding_type(search)
		# return all postings
		else
			scoped
		end

	end

  	def self.search_all(search)
  		 if search
  		 	postings = Array.new
    		Posting.where(['title LIKE ? OR description LIKE ? OR skills LIKE ? OR funding_type LIKE?', "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%"]).each do |posting|
    			postings.push(posting)
    		end
    		self.search_supervisor(search).each do |posting|
    			if !postings.include? posting
    				postings.push(posting)
    			end 
    		end
    		self.search_department(search).each do |posting|
    			if !postings.include? posting
    				postings.push(posting)
    			end
    		end
    		return postings
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
			split_word = search.split(" ")
			if split_word[1].nil?
				split_word[0].delete(" ") unless split_word[0].nil?
				Supervisor.where("first_name like ? or last_name like ? ", "%#{split_word[0]}%", "%#{split_word[0]}%").each do |supervisor|
					supervisor.postings.each do |posting|
						postings.push(posting)
					end
				end
			else
				if !split_word[2].nil?
					return postings
				else
					Supervisor.where("first_name like? or last_name like ?", "%#{split_word[1]}%", "%#{split_word[1]}%").each do |supervisor|
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

	# search by department
	def self.search_department(search)
		if search
			postings = Array.new
			Supervisor.where("department like?", "%#{search}%").each do |supervisor|
				supervisor.postings.each do |posting|
					postings.push(posting)
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


