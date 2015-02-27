class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create	
    @course = Course.new course_params
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
    if params[:course][:start_course]
      start_course
    else
      @course = Course.find params[:id]
      if @course.update_attributes course_params
        redirect_to course_path @course
      else
        render 'edit'
      end
    end
  end

  def start_course
    enrollment_subject
    enrollment_task
    redirect_to course_path @course
  end

  def enrollment_subject
    @course = Course.find params[:id]
    @users = @course.users
    @subjects = @course.subjects
    @users.each do |user|
      @subjects.each do |subject|
        @enrollment_subject = EnrollmentSubject.new
        @enrollment_subject.course_id = @course.id
        @enrollment_subject.user_id = user.id
        @enrollment_subject.subject_id = subject.id
        if @enrollment_subject.save
          flash[:success] = "started"
        else
          flash[:danger] = "start faild"
        end
      end
    end
  end

  def enrollment_task
    @course = Course.find params[:id]
    @users = @course.users
    @subjects = @course.subjects
    @users.each do |user|
      @subjects.each do |subject|
        subject.tasks.each do |task|
          @enrollment_task = EnrollmentTask.new
          @enrollment_task.course_id = @course.id
          @enrollment_task.user_id = user.id
          @enrollment_task.subject_id = subject.id
          @enrollment_task.task_id = task.id
          if @enrollment_task.save
            flash[:success] = "started"
          else
            flash[:danger] = "start faild"
          end
        end
      end
    end 
  end

  private
  def course_params
    params.require(:course).permit(:name, :description)
  end
end