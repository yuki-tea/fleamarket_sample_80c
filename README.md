# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|text|null: false|
|mail|string|null: false, unique: true, add_index|
|password|string|null: false|
|password_conf|string|null: false|
|address|string|null: false|
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
|customer_id|string|null: false, foreign_key: true|
|card_id|string|null: false, foreign_key: true|

### Association
belongs_to: user



## deliveriesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|text|null: false|
|last_name|text|null: false|
|last_name_kana|text|null: false|
|first_name_kana|text|null: false|
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
|image_id|string|null: false|
|name|string|null: false, add_index|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand|text||
|price|string|null: false|

### Association
has_many: images

belongs_to: user
belongs_to: category
belongs_to: purchase




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




