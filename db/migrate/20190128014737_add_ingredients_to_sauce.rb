class AddIngredientsToSauce < ActiveRecord::Migration[5.2]
  def change
    add_column :sauces, :ingredients, :text
  end
end
