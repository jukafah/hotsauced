class RemoveHeatFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :heat, :integer
  end
end
