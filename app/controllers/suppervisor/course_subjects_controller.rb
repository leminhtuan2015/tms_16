class Suppervisor::CourseSubjectsController < ApplicationController
  before_action :admin_user

  def show
    @course = Course.find params[:course_id]
    @subjects = Subject.all
  end

  def update
    @course = Course.find params[:course_id]
    if @course.update_attributes course_subject_params
      flash[:success] = "Assigned!"
      redirect_to suppervisor_course_path params[:course_id]
    else
      flash[:error] = "Sorry! somthing get wrong, we are woking on it."
      redirect_to suppervisor_course_course_subjects_path params[:course_id]
    end
  end

  private
  def course_subject_params
    params.require(:course).permit subject_ids: []
  end

  def admin_user
    if logged_in?
      unless current_user.suppervisor?
        flash[:danger] = "Please log in by suppervisor account."
        redirect_to root_url
      end
    else
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end    
  end
end
