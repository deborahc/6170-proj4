class AddNewfieldToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :expected, :string
    add_column :reviews, :work_description, :text
  end
end
