class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def new
    @user = User.new
    @subjects = Subject.order(:sort_order)
  end

  def create
    @user = User.new(user_params)
    @subjects = Subject.order(:sort_order)

    if @user.save
      redirect_to new_user_path, notice: 'ユーザーを登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :role,
      subject_ids: []
    )
  end
end
