class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :destroy, :update]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy 
    @task.destroy
    redirect_to tasks_path
  end

  private 

    def get_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:body)
    end
end
