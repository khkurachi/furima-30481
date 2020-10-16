require 'rails_helper'

RSpec.describe '新規出品', type: :system do
  before do
    @item = FactoryBot.build(:item)
  end
  context '出品ができるとき' do
    it 'ログインしている状態で正しい情報を入力すればユーザー新規出品ができてトップページに移動する' do
      #ログインする
      visit root_path
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on ('ログイン')
      #新規出品ページへ移動する
      visit new_item_path
      #情報を入力する
      attach_file 'item[image]', "#{Rails.root}/app/assets/images/staff.jpg"
      fill_in 'item[title]', with: "test"
      fill_in 'item[description]', with: "test"
      select 'メンズ', from: 'item[category_id]'
      select '全体的に状態が悪い', from: 'item[condition_id]'
      select '着払い', from: 'item[shipping_cost_id]'
      select '神奈川県', from: 'item[prefecture_id]'
      select '1〜２日', from: 'item[shipping_day_id]'
      fill_in 'item[value]', with: "500"
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name = "commit"]').click
      }.to change{Item.count}.by(1)
      #トップページに移動していることを確認する
      expect(current_path).to eq root_path
    end
  end

  context '出品ができないとき' do
    it 'ログインしている状態で誤った情報を入力すればユーザー新規出品ができず新規投稿ページに戻される' do
      #ログインする
      visit root_path
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on ('ログイン')
      #新規出品ページへ移動する
      visit new_item_path
      #情報を入力する
      attach_file 'item[image]', "#{Rails.root}/app/assets/images/staff.jpg"
      fill_in 'item[title]', with: ""
      fill_in 'item[description]', with: ""
      select '--', from: 'item[category_id]'
      select '--', from: 'item[condition_id]'
      select '--', from: 'item[shipping_cost_id]'
      select '--', from: 'item[prefecture_id]'
      select '--', from: 'item[shipping_day_id]'
      fill_in 'item[value]', with: ""
      # 送信した値がDBに保存されていることを確認する
      expect{
        find('input[name = "commit"]').click
      }.to change{Item.count}.by(0)
      #新規出品ページに戻り、エラーが表示されていることを確認する
      expect(current_path).to eq items_path
    end

    it 'ログインしていない状態で出品ページを尋ねたとき' do
      #ログアウトしてトップページへ移動する
      visit root_path
      #新規出品ページへ移動する
      visit new_item_path
      #ログインページへ戻されたことを確認する
      expect(current_path).to eq new_user_session_path
    end

  end
end