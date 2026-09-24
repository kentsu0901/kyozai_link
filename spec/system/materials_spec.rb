require 'rails_helper'

RSpec.describe '教材新規登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @subject = FactoryBot.create(:subject)
    @another_subject = FactoryBot.create(:subject)
    FactoryBot.create(:user_subject, user: @user, subject: @subject)
    @material = FactoryBot.build(:material, subject: @subject)
  end

  it '一般ユーザーが担当教科の教材を登録できる' do
    # ログインページへ遷移する
    visit new_user_session_path

    # 一般ユーザーでログインする
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click

    # 教材登録画面へ移動する
    click_on '教材登録'

    # 「教材を新規登録」をクリックする
    click_on '教材を新規登録'

    # 必要な情報を入力する
    fill_in '教材名', with: @material.name
    fill_in '出版社', with: @material.publisher
    select '教科書', from: '教材種別'
    fill_in '価格', with: @material.price

    # 「登録」をクリックするとMaterialのレコードが1件増える
    expect { find('input[name="commit"]').click }.to change { Material.count }.by(1)

    # 登録した教材が教材一覧に表示される
    visit materials_path
    expect(page).to have_content(@material.name)
  end

  it '一般ユーザーには担当外の教科が表示されない' do
    # ログインページへ遷移する
    visit new_user_session_path

    # 一般ユーザーでログインする
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click

    # 教材新規登録画面へ移動する
    click_on '教材登録'
    click_on '教材を新規登録'

    # 担当外の教科は表示されない
    expect(page).to have_no_content(@another_subject.name)
  end
end
