class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
def index
end

def new
  @item = Item.new
end

private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end

end




# 出品画像 必須
# クリックしてファイルをアップロード

# 選択されていません
# 商品名 必須
# 商品名（必須 40文字まで)
# 商品の説明 必須
# 商品の説明（必須 1,000文字まで）（色、素材、重さ、定価、注意点など）例）2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。
# 商品の詳細
# カテゴリー 必須

# ---
# 商品の状態 必須

# ---
# 配送について
# ?
# 配送料の負担 必須

# ---
# 発送元の地域 必須

# ---
# 発送までの日数 必須

# ---
# 販売価格
# (¥300〜9,999,999)
# ?
# 価格
# 必須
# ¥
# 半角数字で入力
# 販売手数料 (10%)
# 円
# 販売利益
# 円