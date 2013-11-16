class AddFieldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :email, :string
  	add_column :users, :major, :string
  	add_column :users, :year, :string
  	add_column :users, :resume, :string
  	add_column :users, :password_digest, :string

  	add_column :users, :lab, :string
  	add_column :users, :title, :string
  	add_column :users, :department, :string
  	add_column :users, :office, :string
  end
end
