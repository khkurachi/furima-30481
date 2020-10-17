require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "すべての値が存在すれば登録できること" do
      expect(@item).to be_valid
    end
    it "titleが空では登録できないこと" do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "condition_idが空では登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "shipping_cost_idが空では登録できないこと" do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "shipping_day_idが空では登録できないこと" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end
    it "valueが空では登録できないこと" do
      @item.value = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not a number")
    end
    it "valueが半角数字意外では登録できないこと" do
      @item.value = "アアア"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value is not a number")
    end
    it "valueが300より小さいと登録できないこと" do
      @item.value = "200"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be greater than or equal to 300")
    end
    it "valueが9999999より大きいと登録できないこと" do
      @item.value = "1111111111111"
      @item.valid?
      expect(@item.errors.full_messages).to include("Value must be less than or equal to 9999999")
    end
  end
end