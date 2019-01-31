class RemoveSummaryFromSauce < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :summary, :text
  end
end
