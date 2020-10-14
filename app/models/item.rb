class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  belongs_to :category
end
