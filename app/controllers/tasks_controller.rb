class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :trigger]
  
    def index
      @tasks = (current_user.owned_tasks + current_user.tasks).uniq
    end
  
    def show
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      @task.owner = current_user
      @task.save
      flash[:success] = "Object successfully created"
      #format.html { redirect_to @task, notice: 'Task was successfully created.'}
      #format.json { render :show, status: :created, location: @task }
      redirect_to @task
    end    
  
    def edit
    end

    def update
      @task.update(task_params)
      redirect_to @task
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    def trigger
      Tasks::TriggerEvent.new.call @task, params[:event]
    end

    private

    def task_params
      params.require(:task).permit(:name, :description, :due_date, :category_id, participating_users_attributes: [ :user_id, :role, :id, :_destroy])
    end

    def set_task
      @task = Task.find(params[:id])
    end

end