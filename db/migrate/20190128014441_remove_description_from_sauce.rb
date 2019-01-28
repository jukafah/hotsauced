class RemoveDescriptionFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :description, :string
  end
end
