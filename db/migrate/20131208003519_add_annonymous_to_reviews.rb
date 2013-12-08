class AddAnnonymousToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :anonymous, :boolean
  end
end
