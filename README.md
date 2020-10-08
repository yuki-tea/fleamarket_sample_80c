# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique: true, add_index|
|password|string|null: false|
|password_conf|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|data|null: false|

### Association
has_many: purchases
has_many: items
has_many: deliveries

has_one: credit



## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
belongs_to: user



## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|zip_code|string|null: false|
|municipality|string|null: false|
|street_number|string|null: false|
|building_name|string||
|telephone_number|string|null: false, unique: true|

### Association
belongs_to: user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false, add_index|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand|text||
|item_status_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|handling_time_id|integer|null: false, foreign_key: true|
|price|integer|null: false|

### Association
has_many: images

belongs_to: user
belongs_to: category

has_one: purchase




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many: items


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
belongs_to: item


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to: item
belongs_to: user




