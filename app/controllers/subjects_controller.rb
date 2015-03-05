class SubjectsController < ApplicationController
  before_action :current_user
  before_action :correct_subject, only:[:edit, :update]

  def show
    @course = Course.find params[:course_id]
    @subjects = @course.subjects.paginate page: params[:page]
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = 'Subject updated'
      redirect_to current_user
    else
      render 'edit'  
    end
  end

  private
  def subject_params
    params.require(:subject).permit(enrollment_tasks_attributes: 
      [:id, :user_id, :course_id, :task_id, :status])
  end

  def correct_subject
    @subject = Subject.find params[:id]
    redirect_to root_url unless current_user.subjects.include? @subject
  end
end