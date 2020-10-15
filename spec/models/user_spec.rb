require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nameとemail、passwordとpassword_confirmation、f_name_kanji、l_name_kanji、f_name_kana、l_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが@なしであれば登録できない" do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数字混合でなければ登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "f_name_kanjiが空であれば登録できない" do
        @user.f_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kanji 漢字を使用してください")
      end
      it "f_name_kanjiに全角でなければ登録できない" do
        @user.f_name_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kanji 漢字を使用してください")
      end
      it "l_name_kanjiが空であれば登録できない" do
        @user.l_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kanji 漢字を使用してください")
      end
      it "l_name_kanjiに全角でなけば登録できない" do
        @user.l_name_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kanji 漢字を使用してください")
      end
      it "f_name_kanaが空であれば登録できない" do
        @user.f_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana カナ文字を使用してください")
      end
      it "f_name_kanaが全角カナでなければ登録できない" do
        @user.f_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana カナ文字を使用してください")
      end
      it "l_name_kanaが空であれば登録できない" do
        @user.l_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana カナ文字を使用してください")
      end
      it "l_name_kanaが全角カナでなけば登録できない" do
        @user.l_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana カナ文字を使用してください")
      end
      it "birthdayが空であれば登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end