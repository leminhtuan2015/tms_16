class TasksController < ApplicationController
  def create
    if !params[:name].empty?
      @subject = Subject.find(params[:subject_id])
      @task = @subject.tasks.create task_params
    end
    redirect_to assign_tasks_subject_path params[:subject_id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes task_params
      redirect_to task_detail_subject_path @task
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:subject_id]
    @task = @subject.tasks.find params[:id]
    @task.destroy
    redirect_to edit_tasks_subject_path @task.subject_id
  end

  private
  def task_params
      params.permit(:name, :description)
  end
end