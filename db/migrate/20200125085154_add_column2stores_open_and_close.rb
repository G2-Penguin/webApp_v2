class AddColumn2storesOpenAndClose < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :open, :integer
    add_column :stores, :close, :integer
  end
end
