class CourseMaterialSettingsController < ApplicationController
  def edit
    @subject = Subject.find(params[:subject_id])
    @courses = @subject.courses
    @materials = @subject.materials
  end
end
