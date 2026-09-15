class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_subjects, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:new, :create, :destroy]
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @users = User.order(:id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)

    if @user.save
      redirect_to users_path, notice: 'ユーザーを登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params = current_user.system_admin? ? admin_user_params : user_params

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    if @user.update(params)
      redirect_to users_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_subjects
    @subjects = Subject.order(:sort_order)
  end

  def authenticate_admin!
    return if current_user.system_admin?

    redirect_to users_path, alert: '管理者のみ操作できます'
  end

  def authorize_user!
    return if current_user.system_admin? || current_user == @user

    redirect_to users_path, alert: 'このユーザーを編集する権限がありません'
  end

  def admin_user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :role,
      subject_ids: []
    )
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
