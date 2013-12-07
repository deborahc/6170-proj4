class ChangeResumeTypeInUserToFile < ActiveRecord::Migration
  def self.up
  	add_attachment :users, :resume
  end

  def self.down
  	remove_attachment :friends, :resume
  end
  
end

