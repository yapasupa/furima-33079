require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"





  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "ユーザー情報を正しく入力できれば登録できる。" do
       expect(@user).to be_valid
     end
    end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空では登録できない" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""  # emailの値を空にする
      @user.valid?
    end
    it "ユーザー本名の名字が空では登録できない" do
      @user.first_name = ""  # の値を空にする
      @user.valid?
    end
    it "ユーザー本名の名前が空では登録できない" do
      @user.last_name = ""  # の値を空にする
      @user.valid?
    end
    it "ユーザー本名の名字の振り仮名が空では登録できない" do
      @user.first_name_kana = "" # の値を空にする
      @user.valid?
    end
    it "ユーザー本名の名前の振り仮名が空では登録できない" do
      @user.last_name_kana= "" # の値を空にする
      @user.valid?
    end
    it "生年月日が空では登録できない" do
      @user.birthday = "" # の値を空にする
      @user.valid?
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが6字以上でないと登録できない" do
      @user.password = "aaa00"
      @user.password_confirmation = "aaa00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = "test" 
      @user.valid?
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "テスト" 
      @user.valid?
    end
    it "ユーザー本名の名字は、全角での入力が必須であること" do
      @user.first_name = "test" 
      @user.valid?
    end
    it "ユーザー本名の名前は、全角での入力が必須であること" do
      @user.last_name = "test" 
      @user.valid?
    end
    it "ユーザー本名の名字の振り仮名は、全角での入力が必須であること" do
      @user.first_name_kana = "test" 
      @user.valid?
    end
    it "ユーザー本名の名前の振り仮名は、全角での入力が必須であること" do
      @user.last_name_kana = "test" 
      @user.valid?
    end
    it "パスワードは、英語のみでは登録できないこと" do
      @user.password = "aaaaaa" 
      @user.valid?
    end
    it "パスワードは、数字のみでは登録できないこと" do
      @user.password = "111111" 
      @user.valid?
    end
    it "パスワードは、全角では登録できないこと" do
      @user.password = "テストテスト" 
      @user.valid?
    end
  end
end
end





