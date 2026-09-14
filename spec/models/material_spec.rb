require 'rails_helper'

RSpec.describe Material, type: :model do
  before do
    @material = FactoryBot.build(:material)
  end

  describe '教材情報の登録' do
    context '登録できる場合' do
      it '必要な情報が正しく入力されていれば登録できる' do
        expect(@material).to be_valid
      end

      it 'priceが0でも登録できる' do
        @material.price = 0

        expect(@material).to be_valid
      end
    end

    context '教材情報に不備がある場合' do
      it 'nameが空では登録できない' do
        @material.name = ''

        expect(@material).to be_invalid
        expect(@material.errors.full_messages).to include(
          "Name can't be blank"
        )
      end

      it 'publisherが空では登録できない' do
        @material.publisher = ''

        expect(@material).to be_invalid
        expect(@material.errors.full_messages).to include(
          "Publisher can't be blank"
        )
      end

      it 'material_typeが空では登録できない' do
        @material.material_type = ''

        expect(@material).to be_invalid
        expect(@material.errors.full_messages).to include(
          "Material type can't be blank"
        )
      end

      it 'priceが空では登録できない' do
        @material.price = nil

        expect(@material).to be_invalid
        expect(@material.errors.full_messages).to include(
          "Price can't be blank"
        )
      end

      it 'subjectが紐付いていなければ登録できない' do
        @material.subject = nil

        expect(@material).to be_invalid
        expect(@material.errors.full_messages).to include(
          'Subject must exist'
        )
      end
    end
  end
end