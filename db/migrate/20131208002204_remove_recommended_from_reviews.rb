class RemoveRecommendedFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :recommended, :boolean
  end
end
