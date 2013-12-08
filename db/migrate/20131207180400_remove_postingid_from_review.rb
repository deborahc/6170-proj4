class RemovePostingidFromReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :posting_id, :integer
  end
end
