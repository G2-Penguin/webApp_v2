class ChangeType < ActiveRecord::Migration[5.1]
  def change
    change_column :stores, :open, :string
    change_column :stores, :close, :string
  end
end
