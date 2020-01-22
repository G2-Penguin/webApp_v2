class AddProductImg < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_img, :binary
  end
end
