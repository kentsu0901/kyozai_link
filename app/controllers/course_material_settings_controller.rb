class CourseMaterialSettingsController < ApplicationController
  def edit
    @subject = Subject.find(params[:subject_id])
    @courses = @subject.courses
    @materials = @subject.materials
  end

  def update
    subject = Subject.find(params[:subject_id])
    courses = subject.courses

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
end
