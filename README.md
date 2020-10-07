# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|text|null: false|
|mail|string|null: false, unique: true, add_index|
|password|string|null: false|
|password_conf|string|null: false|
|address|string|null: false|
|last_name|text|null: false|
|first_name|text|null: false|
|first_name_kana|text|null: false|
|last_name_kana|text|null: false|
|birthday|data|null: false|

### Association
has_many: purchases
has_many: items
has_many: deliveries

belongs_to: credit



## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, unique:true|
|validated_month_id|integer|null: false, foreign_key: true|
|validated_year_id|integer|null: false, foreign_key: true|
|security_code|integer|null: false|

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
|zip_code|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|municipality|string|null: false|
|street_number|string|null: false|
|building_name|string||
|telephone_number|string|null: false, unique: true|

### Association
belongs_to: user
belongs_to: prefecture



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|image|string|null: false|
|item_name|text|null: false, add_index|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand|text||
|item_status_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|handling_time_id|integer|null: false, foreign_key: true|
|price|string|null: false|

### Association
belongs_to: category
belongs_to: item_status
belongs_to: shipping_charge
belongs_to: prefecture
belongs_to: handling_time
belongs_to: purchase




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many: items


## item_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many: items


## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many: items


## handling_timesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many: items


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to: item
belongs_to: user


## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
has_many: deliveries
has_many: items

