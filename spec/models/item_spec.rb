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
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not a number")
    end
    it "shipping_cost_idが空では登録できないこと" do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not a number")
    end
    it "prefectureが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it "shipping_day_idが空では登録できないこと" do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day is not a number")
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