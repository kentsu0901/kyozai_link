class MaterialsController < ApplicationController
  before_action :set_subjects, only: [:new, :create, :edit, :update]
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :authorize_material!, only: [:edit, :destroy]

  def index
    @subjects = if current_user.system_admin?
                  Subject.order(:sort_order)
                else
                  current_user.subjects.order(:sort_order)
                end
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)

    unless authorized_subject?(@material.subject_id)
      redirect_to materials_path, alert: '担当外の教科の教材は登録できません'
      return
    end

    if @material.save
      redirect_to new_material_path, notice: '教材を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    unless authorized_subject?(material_params[:subject_id].to_i)
      redirect_to materials_path, alert: '担当外の教科には変更できません'
      return
    end

    if @material.update(material_params)
      redirect_to materials_path, notice: '教材情報を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @material.destroy
    redirect_to materials_path, notice: '教材を削除しました'
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def set_subjects
    @subjects = if current_user.system_admin?
                  Subject.order(:sort_order)
                else
                  current_user.subjects.order(:sort_order)
                end
  end

  def authorize_material!
    return if authorized_subject?(@material.subject_id)

    redirect_to materials_path, alert: 'この教材を操作する権限がありません'
  end

  def authorized_subject?(subject_id)
    current_user.system_admin? || current_user.subject_ids.include?(subject_id)
  end

  def material_params
    params.require(:material).permit(:name, :publisher, :material_type, :price, :subject_id)
  end
end
