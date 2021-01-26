class Item < ApplicationRecord
has_one_attached :image

with_options presence: true do
  validates :name
  validates :text 
  validates :price
end
# validates :price, numericality: { only_integer: true }

with_options numericality: {other_than: 1 }  do
  validates :category_id
  validates :state_id 
  validates :delivery_fee_id
  validates :delivery_area_id 
  validates :delivery_date_id 
end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }



end

# greater_than_or_equal_to: 〇〇	〇〇と同じか、それ以上の数値
# less_than_or_equal_to: △△	△△と同じか、それ以下の数値





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

# ログイン状態のユーザーだけが、商品出品ページへ遷移できること￥
#  index.html.erb

# ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること
# 　controller￥

# 商品画像を1枚つけることが必須であること¥
# 商品名が必須であること¥
# 商品の説明が必須であること¥
# カテゴリーの情報が必須であること¥
# 商品の状態についての情報が必須であること¥
# 配送料の負担についての情報が必須であること¥
# 発送元の地域についての情報が必須であること¥
# 発送までの日数についての情報が必須であること¥
# 価格についての情報が必須であること¥
# 価格の範囲が、¥300~¥9,999,999の間であること¥
# 販売価格は半角数字のみ保存可能であること￥


# 必要な情報を適切に入力すると、商品の出品ができること¥

# 入力された販売価格によって、販売手数料や販売利益の表示が変わること
# ()

# エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）¥
# 入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること¥