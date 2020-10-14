require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'name', with: @user.name
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'first-name', with: @user.l_name_kanji
      fill_in 'last-name', with: @user.f_name_kanji
      fill_in 'first-name-kana', with: @user.l_name_kana
      fill_in 'last-name-kana', with: @user.f_name_kana
      select '1997', from: 'user_birthday_1i'
      select '1', from: 'user_birthday_2i'
      select '7', from: 'user_birthday_3i'
      
      #サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      #トップページへ遷移する
      expect(current_path).to eq root_path
      #カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      #サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end  
  context 'ユーザー新規登録ができないとき' do
    it '誤った呪法ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      #トップページへ移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'name', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      fill_in 'first-name', with: ""
      fill_in 'last-name', with: ""
      fill_in 'first-name-kana', with: ""
      fill_in 'last-name-kana', with: ""
      #サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      #新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end  
end