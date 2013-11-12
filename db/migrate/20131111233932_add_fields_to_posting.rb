class AddFieldsToPosting < ActiveRecord::Migration
  def change
  	add_column :postings, :supervisor_id, :integer
  	add_column :postings, :title, :string
  	add_column :postings, :description, :string
  	add_column :postings, :skills, :string
  	add_column :postings, :funding_type, :string
  end
end
