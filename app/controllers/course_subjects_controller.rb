class CourseSubjectsController < ApplicationController
  def show
    @course = Course.find params[:course_id]
    @subjects = Subject.all
  end

  def update
    course = Course.find params[:course_id]
    if course.update_attributes course_subject_params
      flash[:success] = "Assigned!"
      redirect_to course_path params[:course_id]
    else
      flash[:error] = "Sorry! somthing get wrong, we are woking on it."
      redirect_to course_course_subjects_path params[:course_id]
    end
  end

  def course_subject_params
    params.require(:course).permit(subject_ids: [])
  end
end
