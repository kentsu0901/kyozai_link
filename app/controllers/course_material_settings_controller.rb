class CourseMaterialSettingsController < ApplicationController
  before_action :set_subject, only: [:edit, :update]
  before_action :authorized_material_setting!, only: [:edit, :update]
  def edit
    @courses = @subject.courses
    @materials = @subject.materials
  end

  def update
    courses = @subject.courses

    if params[:course_materials].nil?
      courses.each do |course|
        course.material_ids = []
      end
    else
      courses.each do |course|
        course.material_ids = if params[:course_materials][course.id.to_s].nil?
                                []
                              else
                                params[:course_materials][course.id.to_s]
                              end
      end
    end

    redirect_to course_materials_path
  end

  private

  def authorized_material_setting!
    return if authorized_subject?(@subject.id)

    redirect_to course_materials_path, alert: 'この教材登録を操作する権限がありません'
  end

  def authorized_subject?(subject_id)
    current_user.system_admin? || current_user.subject_ids.include?(subject_id)
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end
end
