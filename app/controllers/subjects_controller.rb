class SubjectsController < ApplicationController
  before_action :correct_user
  before_action :correct_subject, only:[:show, :update]

  def index
    @subjects = current_user.subjects
  end

  def show
    @subject = current_user.subjects.find params[:id]
    @tasks = @subject.tasks
  end

  def update
    @subject = current_user.subjects.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = 'Subject updated'
      redirect_to current_user
    else
      render 'show'  
    end
  end

  private
  def subject_params
    params.require(:subject).permit(enrollment_tasks_attributes: 
      [:id, :user_id, :course_id, :task_id, :status])
  end

  def correct_user
    @user = User.find params[:user_id]
    redirect_to root_url unless current_user? @user
  end

  def correct_subject
    @subject = Subject.find params[:id]
    redirect_to root_url unless current_user.subjects.include? @subject
  end
end