class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  belongs_to :category
  belongs_to :user

  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :shipping_charge_id
  validates :prefecture_id
  validates :handling_time_id
  validates :price
end
