class ChangeTypeTelnumber < ActiveRecord::Migration[5.1]
  def change
    change_column :stores, :tel_number, :string
  end
end
