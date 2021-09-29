## users

|   Column          |   Type   |   Options   |
|-------------------|----------|-------------|
|nickname           |string    |null: false  |
|email              |string    |null: false  |
|encrypted_password |string    |null: false  |
|first_name         |string    |null: false  |
|last_name          |string    |null: false  |
|first_name_kana    |string    |null: false  |
|last_name_kana     |string    |null: false  |
|birth_day          |date      |null: false  |

### Association
has_many :items
has_many :orders




## items

|   Column          |   Type   |   Options   |
|-------------------|----------|-------------|
|item_name          |string    |null: false  |
|description        |text      |null: false  |
|category           |integer   |null: false  |
|condition          |integer   |null: false  |
|delivery_free      |integer   |null: false  |
|area               |integer   |null: false  |
|delivery_day       |integer   |null: false  |
|price              |integer   |null: false  |

### Association
belongs_to :users
has_one :orders





## addresses

|   Column          |   Type   |   Options   |
|-------------------|----------|-------------|
|postal_code        |string    |null: false  |
|prefecture         |integer   |null: false  |
|city               |string    |null: false  |
|house_number       |string    |null: false  |
|building           |string    |             |
|phone_number       |string    |null: false  |

### Association
belongs_to :orders





## orders

|   Column          |   Type   |   Options                     |
|-------------------|----------|-------------------------------|
|user               |references|null: false, foreign_key: true |
|item               |references|null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :items
has_one :addresses

