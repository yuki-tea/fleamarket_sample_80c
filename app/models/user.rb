class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions    
  belongs_to_active_hash :prefecture


  validates :name, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :first_name_kana, presence: true, uniqueness: true
  validates :last_name_kana, presence: true, uniqueness: true
  validates :birthday, presence: true, uniqueness: true
  validates :delivery_first_name, presence: true, uniqueness: true
  validates :delivery_last_name, presence: true, uniqueness: true
  validates :delivery_first_name_kana, presence: true, uniqueness: true
  validates :delivery_last_name_kana, presence: true, uniqueness: true
  validates :zip_code, presence: true, uniqueness: true
  validates :prefecture_id, presence: true, uniqueness: true
  validates :municipality, presence: true, uniqueness: true
  validates :street_number, presence: true, uniqueness: true
  validates :building_name, presence: true, uniqueness: true
  validates :telephone_number, presence: true, uniqueness: true

  


end

