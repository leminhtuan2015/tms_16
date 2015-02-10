class TasksController < ApplicationController
  def create
    if !params[:name].empty?
      @task = Task.new(task_params)
      @task.save
    end  
    redirect_to subject_path params[:subject_id]
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes task_params
      redirect_to subject_path @task.subject_id
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to subject_path @task.subject_id
  end

  private
  def task_params
      params.permit(:name, :description, :subject_id)
  end
end