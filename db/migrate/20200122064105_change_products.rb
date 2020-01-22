class ChangeProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :count, :integer
  end
end
