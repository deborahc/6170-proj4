class AddRatingsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :overall_rating, :string
    add_column :reviews, :supervisor_rating, :string
  end
end
