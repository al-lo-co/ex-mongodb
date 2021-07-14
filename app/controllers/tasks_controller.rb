class TasksController < ApplicationController

  
    def index
      @tasks = Task.joins(:participants).where('owner_id = ? OR participants.user_id = ?', current_user.id, current_user.id).group(:id)
    end
  
    def show
      @task = Task.find(params[:id])
    end

    def new
      @categories = Category.all
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      @task.owner = current_user
      @task.save
    end
  
    def update
      @task = Task.find(task_params)
      @task.update_params(task_params)
    end
  
    def edit
      @categories = Category.all
      @task = Task.find(params[:id])
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path
    end
    private
    def task_params
      params.require(:task).permit(:name, :description, :due_date, :category_id, participating_users_attributes: [ :user_id, :role, :id, :_destroy])
    end

end