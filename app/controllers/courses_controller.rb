class CoursesController < ApplicationController
  def index
    @subjects = Subject.order(:sort_order)
  end

  def new
    @course = Course.new
    @subjects = Subject.order(:sort_order)
    @academic_years = AcademicYear.order(:year)
  end

  def create
    @course = Course.new(course_params)
    @subjects = Subject.order(:sort_order)
    @academic_years = AcademicYear.order(:year)

    if @course.save
      redirect_to new_course_path, notice: '授業を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :grade, :subject_id, :academic_year_id)
  end
end
