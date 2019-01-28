class RemoveRatingFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :rating, :integer
  end
end
