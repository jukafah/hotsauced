class AddHeadlineToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :headline, :string
  end
end
