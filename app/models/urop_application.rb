class UropApplication < ActiveRecord::Base
	belongs_to :student
	belongs_to :posting
end
