require 'rails_helper'

RSpec.describe CourseMaterial, type: :model do
  before do
    @course_material = FactoryBot.build(:course_material)
  end

  describe '授業教材情報の登録' do
    context '登録できる場合' do
      it 'courseとmaterialが紐付いていれば登録できる' do
        expect(@course_material).to be_valid
      end
    end

    context '授業教材情報に不備がある場合' do
      it 'courseが紐付いていなければ登録できない' do
        @course_material.course = nil

        expect(@course_material).to be_invalid
        expect(@course_material.errors.full_messages).to include('Course must exist')
      end

      it 'materialが紐付いていなければ登録できない' do
        @course_material.material = nil

        expect(@course_material).to be_invalid
        expect(@course_material.errors.full_messages).to include('Material must exist')
      end

      it '同じcourseとmaterialの組み合わせでは登録できない' do
        course_material = FactoryBot.create(:course_material)

        another_course_material = FactoryBot.build(:course_material, course: course_material.course,
                                                                     material: course_material.material)

        expect(another_course_material).to be_invalid
      end
    end
  end
end
