class CoursesController < ApplicationController
  include ApplicationHelper

  def index
    @courses = Course.all
  end

  def create	
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find params[:id]
    @subjects = Subject.all
  end

  def edit
    @course = Course.find params[:id]
    @course_subject = CourseSubject.new
    @subjects = Subject.all
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    redirect_to courses_path
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes course_params
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def add_subject
    @course_subject = CourseSubject.new
    @subjects = Subject.all
    @course = Course.find params[:id]
  end

  def assign_user
    @enrollment = Enrollment.new
    @users = User.all
    @course = Course.find params[:id]
  end

  private
  def course_params
    params.require(:course).permit(:name, :description)
  end
end