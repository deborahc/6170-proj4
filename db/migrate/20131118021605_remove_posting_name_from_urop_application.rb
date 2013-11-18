class RemovePostingNameFromUropApplication < ActiveRecord::Migration
  def change
    remove_column :urop_applications, :posting_name, :string
  end
end
