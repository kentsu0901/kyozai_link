require 'rails_helper'

RSpec.describe UserSubject, type: :model do
  before do
    @user_subject = FactoryBot.build(:user_subject)
  end

  describe '担当教科情報の登録' do
    context '登録できる場合' do
      it 'userとsubjectが紐付いていれば登録できる' do
        expect(@user_subject).to be_valid
      end
    end

    context '担当教科情報に不備がある場合' do
      it 'userが紐付いていなければ登録できない' do
        @user_subject.user = nil

        expect(@user_subject).to be_invalid
        expect(@user_subject.errors.full_messages).to include('User must exist')
      end

      it 'subjectが紐付いていなければ登録できない' do
        @user_subject.subject = nil

        expect(@user_subject).to be_invalid
        expect(@user_subject.errors.full_messages).to include('Subject must exist')
      end

      it '同じuserとsubjectの組み合わせでは登録できない' do
        user_subject = FactoryBot.create(:user_subject)

        another_user_subject = FactoryBot.build(:user_subject, user: user_subject.user, subject: user_subject.subject)

        expect(another_user_subject).to be_invalid
      end
    end
  end
end
