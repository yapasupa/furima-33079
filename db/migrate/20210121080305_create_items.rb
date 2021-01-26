class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,               null:false
      t.text       :text,               null:false
      t.integer    :price,              null:false
      t.references :user,               null:false
      t.integer    :category_id,        null:false
      t.integer    :state_id,           null:false
      t.integer    :delivery_fee_id,    null:false
      t.integer    :delivery_area_id,   null:false
      t.integer    :delivery_date_id,   null:false
      t.timestamps
    end
  end
end






# | Column             |Type          | Options                    |
# | ------------------ |------------- | -------------------------- |
# | name               | string       |null:false                  |
# | text               | text         |null:false                  |
# | price              | integer      |null:false                  |
# | user               | references   |null:false foreign_key true |
# | category_id        | integer      |null:false                  |ActiveHashで実装
# | state_id           | integer      |null:false                  |ActiveHashで実装
# | delivery_fee_ id   | integer      |null:false                  |ActiveHashで実装
# | delivery_area_id   | integer      |null:false                  |ActiveHashで実装
# | delivery_date_id   | integer      |null:false                  |ActiveHashで実装




