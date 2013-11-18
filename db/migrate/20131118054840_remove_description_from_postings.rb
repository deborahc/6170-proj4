class RemoveDescriptionFromPostings < ActiveRecord::Migration
  def change
    remove_column :postings, :description, :string
  end
end
