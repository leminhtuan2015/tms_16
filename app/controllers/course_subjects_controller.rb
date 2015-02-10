class CourseSubjectsController < ApplicationController
  def show
    @course = Course.find params[:course_id]
    @subjects = Subject.all
  end

  def create
    p params
    course_id = params[:course_id]
    CourseSubject.where(:course_id => course_id.to_i).delete_all
    if params.has_key?(:subjects)
      params[:subjects].each do |s|
        course_subject = CourseSubject.new course_subject_params
        course_subject.course_id = course_id
        course_subject.subject_id = subject_id = s[:subject_id]
        course_subject.save
      end  
    end
    redirect_to course_path params[:course_id]
  end
  
  private
  def course_subject_params
    params.permit(:course_id, :subject_id)
  end
end