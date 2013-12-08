class AddFieldsToReview < ActiveRecord::Migration
  def change
  	add_column :reviews, :supervisor_id, :integer
  	add_column :reviews, :student_id, :integer
  	add_column :reviews, :reflection, :text
  	add_column :reviews, :overall_rating, :string
	add_column :reviews, :supervisor_rating, :string
	add_column :reviews, :time_commitment, :integer
	add_column :reviews, :recommended, :boolean
  end
end
