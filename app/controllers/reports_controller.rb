class ReportsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    if current_user? @user
      @course = current_user.courses.first
      @subjects = current_user.subjects
    end
  end
end
