class AddProductStore < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_store, :string
  end
end
