class RemoveRatingsFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :overall_rating, :integer
    remove_column :reviews, :supervisor_rating, :integer
  end
end
