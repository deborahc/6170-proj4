class AddStatusToUropApplication < ActiveRecord::Migration
  def change
    add_column :urop_applications, :status, :string
  end
end
