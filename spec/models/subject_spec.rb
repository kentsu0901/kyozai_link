require 'rails_helper'

RSpec.describe Subject, type: :model do
  before do
    @subject = FactoryBot.build(:subject)
  end

  describe '教科情報の登録' do
    context '登録できる場合' do
      it '必要な情報が正しく入力されていれば登録できる' do
        expect(@subject).to be_valid
      end
    end

    context '教科情報に不備がある場合' do
      it 'nameが空では登録できない' do
        @subject.name = ''
        expect(@subject).to be_invalid
        expect(
          @subject.errors.full_messages
        ).to include(
          "Name can't be blank"
        )
      end

      it '同じnameでは登録できない' do
        @subject.save
        another_subject = FactoryBot.build(:subject, name: @subject.name, sort_order: 5)

        expect(another_subject).to be_invalid
        expect(
          another_subject.errors.full_messages
        ).to include(
          'Name has already been taken'
        )
      end

      it 'sort_orderが空では登録できない' do
        @subject.sort_order = nil

        expect(@subject).to be_invalid
        expect(
          @subject.errors.full_messages
        ).to include(
          "Sort order can't be blank"
        )
      end

      it '同じsort_orderでは登録できない' do
        @subject.save
        another_subject = FactoryBot.build(:subject, name: '国語', sort_order: @subject.sort_order)

        expect(another_subject).to be_invalid
        expect(
          another_subject.errors.full_messages
        ).to include(
          'Sort order has already been taken'
        )
      end
    end
  end
end
