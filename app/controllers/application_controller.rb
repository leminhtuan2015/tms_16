class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  private
  def update_course_subject(params)
    if params.has_key?(:course_id)
      course_id = params[:course_id]
    else
      course_id = params[:id]
    end
    
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

end
