class TasksController < ApplicationController
  def create
  	if !params[:name].empty?
      @task = Task.new(task_params)
      @task.save
    end  
	  redirect_to subject_path params[:subject_id]
  end

  private
    def task_params
      params.permit(:name, :description, :subject_id)
    end
end
