class EnrollmentsController < ApplicationController
  def show
  	@course = Course.find params[:course_id]
  	@users = User.all
  end

  def update
    course = Course.find params[:course_id]
    #if !params[:course][:user_ids][0]=="0"
    course.update_attributes enrollment_params
    redirect_to  course_path params[:course_id]
  end

  def enrollment_params
    params.require(:course).permit(:user_ids => [])
  end

end