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
RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'ログインに成功し、トップページに遷移する' do
    #トップページへ移動する
    visit root_path
    #トップページにサインインページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # サインインページへ移動する
    visit new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    # ログインボタンをクリックする
    click_on ('ログイン')
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path   
  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # トップページに遷移する
    visit root_path
    #トップページにサインインページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
     # サインインページへ移動する
     visit new_user_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    # 誤ったユーザー情報を入力する
    fill_in 'email', with: ""
    fill_in 'password', with: ""
    # ログインボタンをクリックする
    click_on ('ログイン')
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq user_session_path
  end
end
RSpec.describe "ユーザーログアウト機能", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  it 'ログアウトに成功しトップページへ戻る' do
    #ログインする
    visit root_path
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on ('ログイン')
    #トップページにログアウトボタンがあることを確認する
    expect(current_path).to eq root_path
    #ログアウトボタンをクリックする
    click_on ('ログアウト')
    #トップページにログインボタンがあることを確認する
    expect(page).to have_content('ログイン')
  end
end