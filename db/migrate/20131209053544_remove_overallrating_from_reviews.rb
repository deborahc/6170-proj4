class RemoveOverallratingFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :overall_rating, :string
  end
end
