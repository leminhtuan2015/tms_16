class EnrollmentsController < ApplicationController
  def show
    @course = Course.find params[:course_id]
    @users = User.all
  end

  def update
    course = Course.find params[:course_id]
    if course.update_attributes(enrollment_params)
      flash[:success] = "Assigned!"
      redirect_to course_path params[:course_id]
    else
      flash[:error] = "Sorry! somthing get wrong, we are woking on it."
      redirect_to course_enrollments_path params[:course_id]
    end
  end

  def enrollment_params
    params.require(:course).permit(:user_ids => [])
  end
end