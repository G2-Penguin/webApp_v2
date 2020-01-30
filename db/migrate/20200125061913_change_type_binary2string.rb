class ChangeTypeBinary2string < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :product_img, :string
  end
end
