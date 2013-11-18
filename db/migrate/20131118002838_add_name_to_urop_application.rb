class AddNameToUropApplication < ActiveRecord::Migration
  def change
  	add_column :urop_applications,:posting_name,:string
  end
end
