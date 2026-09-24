require 'rails_helper'

RSpec.describe 'CourseMaterials', type: :system do
  before do
    @user = FactoryBot.create(:user, role: 'system_admin')
    @subject = FactoryBot.create(:subject)
    @material = FactoryBot.create(:material, subject: @subject)
    @academic_year = FactoryBot.create(:academic_year)
    @course = FactoryBot.create(:course, subject: @subject, academic_year: @academic_year)
  end

  it 'システム管理者が授業と教材を紐付けできる' do
    # ログインページへ遷移する
    visit new_user_session_path

    # 管理者ユーザーでログインする
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click

    # 「授業別教材一覧」をクリックする
    click_on '授業別教材一覧'

    # 「教材設定」をクリックする
    click_on '教材設定'

    # 必要な情報を入力する
    find("input[name='course_materials[#{@course.id}][]']").click

    # 「更新」をクリックするとCourseMaterialのレコードが1件増える
    expect { find('input[name="commit"]').click }.to change { CourseMaterial.count }.by(1)
  end
end
