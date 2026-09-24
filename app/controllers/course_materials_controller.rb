class CourseMaterialsController < ApplicationController
  def index
    @subjects = if current_user.system_admin?
                  Subject.order(:sort_order)
                else
                  current_user.subjects.order(:sort_order)
                end
  end
end
