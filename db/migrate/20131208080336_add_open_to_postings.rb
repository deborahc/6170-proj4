class AddOpenToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :open, :boolean
  end
end
