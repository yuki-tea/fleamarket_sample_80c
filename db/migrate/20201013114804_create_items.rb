class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false ,foreign_key: true
      t.string :name, null: false 
      t.text :description, null: false
      t.integer :category_id , null:false,foreign_key: true
      t.text :brand
      t.integer :item_status_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
