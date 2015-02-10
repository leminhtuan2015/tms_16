class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find params[:id]
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
    @task = Task.new
  end

  def update
    if params[:name]!=""
      @task = Task.new params.permit(:name, :description, :subject_id)
      @task.save
    end
    @subject = Subject.find(params[:id])
    if @subject.update_attributes subject_params
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

  def assign_tasks
    @task = Task.new
    @subject = Subject.find params[:id]
  end

  def edit_tasks
    @task = Task.new
    @subject = Subject.find params[:id]
  end

  def task_detail
    @task = Task.find params[:id]
  end

  def task_edit
    @task = Task.find params[:id]
  end

  def destroy
    subject = Subject.find params[:id]
    subject.destroy
    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :description)
  end
end