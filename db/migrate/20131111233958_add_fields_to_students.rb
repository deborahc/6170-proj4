class AddFieldsToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :first_name, :string
  	add_column :students, :last_name, :string
  	add_column :students, :email, :string
  	add_column :students, :major, :string
  	add_column :students, :year, :string
  	add_column :students, :resume, :string
  	add_column :students, :password_digest, :string
  end
end
