require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の情報の入力" do
    context '新規登録がうまくいくとき' do
      it "商品情報を正しく入力できれば登録できる。" do
       expect(@item).to be_valid
     end
    end

    context '情報の入力が上手くいかない時' do
      it "nameが空では登録できない" do
        @item.name = ""  # nameの値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できない" do
        @item.text = ""  # 値を空にする
        binding.pry
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーidが1では登録できない" do
        @item.category_id = 1  # の値を空にする
        @item.valid?
      end
      it "商品の状態が空では登録できない" do
        @item.state_id = 1  # の値を空にする
        @item.valid?
      end
      it "配送料の負担が空では登録できない" do
        @item.delivery_fee_id = 1 # の値を空にする
        @item.valid?
      end
      it "発送元の地域が空では登録できない" do
        @item.delivery_area_id  = 1 # の値を空にする
        @item.valid?
      end
      it "発送までの日数が空では登録できない" do
        @item.delivery_date_id = 1 # の値を空にする
        @item.valid?
      end
      it "販売価格が空では登録できない" do
        @item.price = "" # の値を空にする
        @item.valid?
      end
      it "商品画像が空では登録できない" do
        @item.image = nil # の値を空にする
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "テスト" 
        @item.valid?
      end
      it "価格の範囲が、¥300未満の時は登録できない" do
        @item.price = 299 # 
        @item.valid?
      end
      it "価格の範囲が、¥10000000以上の時は登録できない" do
        @item.price = 10000000 # 
        @item.valid?
      end
    end
  end
end

# 実装条件
# - ログイン状態のユーザーだけが、商品出品ページへ遷移できること￥
# - ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること￥
# - 商品画像を1枚つけることが必須であること¥
# - 商品名が必須であること¥
# - 商品の説明が必須であること¥
# - カテゴリーの情報が必須であること¥
# - 商品の状態についての情報が必須であること¥
# - 配送料の負担についての情報が必須であること¥
# - 発送元の地域についての情報が必須であること¥
# - 発送までの日数についての情報が必須であること¥
# - 価格についての情報が必須であること¥
# - 価格の範囲が、¥300~¥9,999,999の間であること¥
# - 販売価格は半角数字のみ保存可能であること¥
# - 入力された販売価格によって、販売手数料や販売利益の表示が変わること¥
# - 必要な情報を適切に入力すると、商品の出品ができること¥
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）¥
# - 入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること¥




# with_options presence: true do
#   validates :name
#   validates :text
#   validates :category_id
#   validates :state_id 
#   validates :delivery_fee_id  
#   validates :first_name_kana
#   validates :last_name_kana
#   validates :delivery_area_id 
#   validates :delivery_date_id 
#   validates :price
#   validates :delivery_area_id 
#   validates :delivery_date_id 
# end

# validates :price, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角文字を使用してください' }
