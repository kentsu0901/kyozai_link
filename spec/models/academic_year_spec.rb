require 'rails_helper'

RSpec.describe AcademicYear, type: :model do
  before do
    @academic_year = FactoryBot.build(:academic_year)
  end

  describe '年度情報の登録' do
    context '登録できる場合' do
      it 'yearが正しく入力されていれば登録できる' do
        expect(@academic_year).to be_valid
      end
    end

    context '年度情報に不備がある場合' do
      it 'yearが空では登録できない' do
        @academic_year.year = nil

        expect(@academic_year).to be_invalid
        expect(
          @academic_year.errors.full_messages
        ).to include("Year can't be blank")
      end

      it '同じyearでは登録できない' do
        @academic_year.save
        another_academic_year = FactoryBot.build(:academic_year, year: @academic_year.year)

        expect(another_academic_year).to be_invalid
        expect(another_academic_year.errors.full_messages).to include(
          'Year has already been taken'
        )
      end
    end
  end
end
