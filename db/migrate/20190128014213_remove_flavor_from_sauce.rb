class RemoveFlavorFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :flavor, :integer
  end
end
