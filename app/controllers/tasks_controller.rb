class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def show
  end

  def new
    @task = current_user.tasks.build
  end
end