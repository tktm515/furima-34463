require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  
  describe '商品購入の登録' do
    context '商品購入の登録ができる場合' do
      it '郵便番号、都道府県、市町村、番地、電話番号、token、user_id、item_idがあれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入の登録ができない場合' do
      it '郵便番号が空では登録できない' do
        @purchase_address.post_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post num can't be blank")
      end

      it '都道府県が---だと登録できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市町村が空だと登録できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと登録できない' do
        @purchase_address.phone_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it '郵便番号に-が含まれていないと登録できない' do
        @purchase_address.post_num = 1234567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end

      it '電話番号が10文字以上11文字以下でないと登録できない' do
        @purchase_address.phone_num = 12345
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "未ログインユーザーは登録できない事" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it "商品が存在しないと登録できない事" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
