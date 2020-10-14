class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
