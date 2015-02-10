class TasksController < ApplicationController
  def index
    @task = Task.new
    @subject = Subject.find params[:subject_id]
  end

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
    @subject = Subject.find params[:subject_id]
  end

  def edit
    @subject = Subject.find params[:subject_id]
    @task = Task.find params[:id]
  end

  def create
    p params
    if !params[:name].empty?
      @subject = Subject.find params[:subject_id]
      @task = @subject.tasks.create task_params
    end
    redirect_to new_subject_task_path(params[:subject_id])
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes task_params
      redirect_to subject_tasks_path(@task.subject)
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:subject_id]
    @task = @subject.tasks.find params[:id]
    @task.destroy
    redirect_to subject_tasks_path(@subject)
  end

  private
  def task_params
      params.permit(:name, :description)
  end
end