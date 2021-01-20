class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


with_options presence: true do
  validates :nickname
  validates :email
  validates :password
  validates :first_name
  validates :last_name
  validates :first_name_kana
  validates :last_name_kana
  validates :birthday
end
 
with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
end

with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
  validates :first_name_kana
  validates :last_name_kana
end

validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角文字を使用してください' }

end
# 新規登録/ユーザー情報
# ニックネームが必須であること¥
# メールアドレスが必須であること¥
# メールアドレスが一意性であること￥￥
# メールアドレスは、@を含む必要があること¥
# パスワードが必須であること¥
# パスワードは、6文字以上での入力が必須であること¥¥
# パスワードは、半角英数字混合での入力が必須であること￥
# パスワードは、確認用を含めて2回入力すること¥
# パスワードとパスワード（確認用）、値の一致が必須であること¥¥
# 新規登録/本人情報確認
# ユーザー本名は、名字と名前がそれぞれ必須であること¥
# ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること¥
# ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること¥
# ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること¥
# 生年月日が必須であること¥