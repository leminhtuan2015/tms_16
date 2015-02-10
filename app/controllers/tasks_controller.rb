class TasksController < ApplicationController
  def show
    @task = Task.find params[:id]
  end

  def edit
    @subject = Subject.find params[:subject_id]
    @task = Task.find params[:id]
  end

  def create
    if !params[:name].empty?
      @subject = Subject.find params[:subject_id]
      @task = @subject.tasks.create task_params
    end
    redirect_to edit_subject_path(params[:subject_id], act: "assign_tasks")
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes task_params
      redirect_to edit_subject_path(@task.subject, act: "tasks")
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:subject_id]
    @task = @subject.tasks.find params[:id]
    @task.destroy
    redirect_to edit_subject_path(@subject, act: "tasks")
  end

  private
  def task_params
      params.permit(:name, :description)
  end
end