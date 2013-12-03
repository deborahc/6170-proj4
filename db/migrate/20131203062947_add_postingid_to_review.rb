class AddPostingidToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :posting_id, :integer
  end
end
