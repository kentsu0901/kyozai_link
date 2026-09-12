class CoursesController < ApplicationController
  def index
    @subjects = Subject.order(:sort_order)
  end
end
