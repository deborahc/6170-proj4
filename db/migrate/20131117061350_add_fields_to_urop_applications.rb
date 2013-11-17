class AddFieldsToUropApplications < ActiveRecord::Migration
  def change
  	add_column :urop_applications, :posting_id, :integer
  	add_column :urop_applications, :student_id, :integer
  	add_column :urop_applications, :message, :text
  end
end
