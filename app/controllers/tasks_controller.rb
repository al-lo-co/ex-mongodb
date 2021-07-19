class TasksController < ApplicationController

  
    def index
      @tasks = (current_user.owned_tasks + current_user.tasks).uniq
    end
  
    def show
      @task = Task.find(params[:id])
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      @task.owner = current_user
      @task.save
      flash[:success] = "Object successfully created"
      redirect_to @task
    end    
  
    def update
      @task = Task.find(params[:id])
      @task.update(task_params)
      redirect_to @task
    end
  
    def edit
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