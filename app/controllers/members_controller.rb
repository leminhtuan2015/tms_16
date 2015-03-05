class MembersController < ApplicationController
  def show
    @course = Course.find params[:course_id]
    @members = @course.users.paginate page: params[:page]
  end
end