require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  it "必須フォームの全てを正しく入力すれば保存ができること" do
    expect(@address_purchase).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @address_purchase.token = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号が空では登録できないこと" do
    @address_purchase.postal_code = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
  end

  it "郵便番号はハイフンが無いと登録できない" do
    @address_purchase.postal_code = "1111111"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Postal code is invalid")
  end

  it "prefecture_idが空では登録できないこと" do
    @address_purchase.prefecture_id = "1"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "municipalityが空では登録できないこと" do
    @address_purchase.municipality = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Municipality can't be blank")
  end

  it "addressが空では登録できないこと" do
    @address_purchase.address = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
  end

  it "電話番号が空では登録できないこと" do
    @address_purchase.phone_number = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
  end

  it "電話番号は12文字以上では登録できない" do
    @address_purchase.phone_number = "123123412345"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Phone number is invalid")
  end

  it "電話番号は10文字未満では登録できない" do
    @address_purchase.phone_number = "123123123"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Phone number is invalid")
  end

end