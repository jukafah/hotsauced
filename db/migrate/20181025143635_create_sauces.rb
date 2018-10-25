class CreateSauces < ActiveRecord::Migration[5.2]
  def change
    create_table :sauces do |t|
      t.string :name
      t.text :summary
      t.integer :flavor
      t.integer :heat
      t.integer :rating

      t.timestamps
    end
  end
end
