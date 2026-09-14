class MaterialsController < ApplicationController
  before_action :set_subjects, only: [:new, :create]

  def index
    @subjects = Subject.order(:sort_order)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)

    if @material.save
      redirect_to new_material_path, notice: '教材を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_subjects
    if current_user.role == 'system_admin'
      @subjects = Subject.order(:sort_order)
    else
      @subjects = current_user.subjects.order(:sort_order)
    end
  end

  def material_params
    params.require(:material).permit(
      :name,
      :publisher,
      :material_type,
      :price,
      :subject_id
    )
  end
end
