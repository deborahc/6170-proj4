class AddFieldsToSupervisor < ActiveRecord::Migration
  def change
  	add_column :supervisors, :first_name, :string
  	add_column :supervisors, :last_name, :string
  	add_column :supervisors, :lab, :string
  	add_column :supervisors, :title, :string
  	add_column :supervisors, :email, :string
  	add_column :supervisors, :department, :string
  	add_column :supervisors, :office, :string
  	add_column :supervisors, :password_digest, :string
  end
end
