class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :store_id
      t.text :store_name
      t.text :address
      t.integer :tel_number
      t.text :hp_url
      t.text :store_image

      t.timestamps
    end
  end
end
