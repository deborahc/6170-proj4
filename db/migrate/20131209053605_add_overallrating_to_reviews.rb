class AddOverallratingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :overall_rating, :integer
  end
end
