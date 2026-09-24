require 'rails_helper'

RSpec.describe '授業新規登録', type: :system do
  before do
    @user = FactoryBot.create(:user, role: 'system_admin')
    @subject = FactoryBot.create(:subject)
    @academic_year = FactoryBot.create(:academic_year)
    @course = FactoryBot.build(:course, subject: @subject, academic_year: @academic_year)
  end

  it 'システム管理者が授業を登録できる' do
    # ログインページへ遷移する
    visit new_user_session_path

    # 管理者ユーザーでログインする
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click

    # 「授業管理」をクリックする
    click_on '授業管理'

    # 「授業を新規登録」をクリックする
    click_on '授業を新規登録'

    # 必要な情報を入力する
    fill_in '授業名', with: @course.name
    select '1年', from: '学年'
    select @course.subject.name, from: '教科'
    select @course.academic_year.year, from: '年度'

    # 「登録」をクリックするとCourseのレコードが1件増える
    expect { find('input[name="commit"]').click }.to change { Course.count }.by(1)

    # 登録した授業が授業一覧に表示される
    visit courses_path
    expect(page).to have_content(@course.name)
  end
end
