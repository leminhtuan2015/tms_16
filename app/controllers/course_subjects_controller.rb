class CourseSubjectsController < ApplicationController
  def index
  	Course.find(1).containing(1)
  end

  def create
    update_course_subject params
    redirect_to course_path params[:course_id]
  end

  def destroy
    
  end

  private
    def course_subject_params
      params.require(:course_subject).permit(:course_id, :subject_id)
    end
end
