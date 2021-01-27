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

validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角文字を使用してください' }

has_many :items
end