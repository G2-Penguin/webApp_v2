class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name
      t.integer :price
      t.integer :discount_rate
      t.string :category
      t.string :amount

      t.timestamps
    end
  end
end
