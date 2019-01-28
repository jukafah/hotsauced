class RemoveIngredientsFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :ingredients, :text
  end
end
