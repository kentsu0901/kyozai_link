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

  def edit
    @course = Course.find(params[:id])
    @subjects = Subject.order(:sort_order)
    @academic_years = AcademicYear.order(:year)
  end

  def update
    @course = Course.find(params[:id])
    @subjects = Subject.order(:sort_order)
    @academic_years = AcademicYear.order(:year)

    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :grade, :subject_id, :academic_year_id)
  end
end
