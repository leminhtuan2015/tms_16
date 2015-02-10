class CourseSubjectsController < ApplicationController
  def create
    p params
    update_course_subject params
    redirect_to course_path params[:course_id]
  end

  def update_course_subject(params)
    course_id = params[:course_id]
    CourseSubject.where(:course_id => course_id.to_i).delete_all
    if params.has_key?(:subjects)
      params[:subjects].each do |s|
        course_subject = CourseSubject.new
        course_subject.course_id = course_id
        course_subject.subject_id = subject_id = s[:subject_id]
        if !CourseSubject.exists?(:course_id => course_id, :subject_id => subject_id)
          course_subject.save
        end
      end  
    end
  end
  
  private
  def course_subject_params
    params.require(:course_subject).permit(:course_id, :subject_id)
  end
end