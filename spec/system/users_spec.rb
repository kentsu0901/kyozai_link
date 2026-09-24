require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  before do
    @admin_user = FactoryBot.create(:user, role: 'system_admin')
    @user = FactoryBot.build(:user, email: 'user@example.com', name: 'いろはにほへほ')
    @subject = FactoryBot.create(:subject)
  end

  it 'システム管理者がユーザーを登録できる' do
    # ログインページへ遷移する
    visit new_user_session_path

    # 管理者ユーザーでログインする
    fill_in 'メールアドレス', with: @admin_user.email
    fill_in 'パスワード', with: @admin_user.password
    find('input[name="commit"]').click

    # 「ユーザー一覧」をクリックする
    click_on 'ユーザー一覧'

    # 「ユーザーを新規登録」をクリックする
    click_on 'ユーザーを新規登録'

    # 必要な情報を入力する
    fill_in 'ユーザー名', with: @user.name
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    fill_in 'パスワード確認', with: @user.password
    select '一般', from: '管理権限'
    check @subject.name

    # 「登録」をクリックするとUserのレコードが1件増える
    expect { find('input[name="commit"]').click }.to change { User.count }.by(1)

    # 登録したuserがユーザー一覧に表示される
    expect(page).to have_content(@user.name)
  end
end
