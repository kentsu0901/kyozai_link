require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = FactoryBot.build(:course)
  end

  describe '授業情報の登録' do
    context '登録できる場合' do
      it '必要な情報が正しく入力されていれば登録できる' do
        expect(@course).to be_valid
      end
    end

    context '授業情報に不備がある場合' do
      it 'nameが空では登録できない' do
        @course.name = ''

        expect(@course).to be_invalid
        expect(@course.errors.full_messages).to include(
          "Name can't be blank"
        )
      end

      it 'gradeが空では登録できない' do
        @course.grade = nil

        expect(@course).to be_invalid
        expect(@course.errors.full_messages).to include(
          "Grade can't be blank"
        )
      end

      it 'subjectが紐付いていなければ登録できない' do
        @course.subject = nil

        expect(@course).to be_invalid
        expect(@course.errors.full_messages).to include(
          'Subject must exist'
        )
      end

      it 'academic_yearが紐付いていなければ登録できない' do
        @course.academic_year = nil

        expect(@course).to be_invalid
        expect(@course.errors.full_messages).to include(
          'Academic year must exist'
        )
      end
    end
  end
end
