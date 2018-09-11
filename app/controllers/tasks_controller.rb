class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :destroy, :update]
  before_action :get_list

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to board_lists_path(@list.board_id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: board_lists_path(@list.board_id)}
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

    def get_list 
      @list = List.find(params[:list_id])
    end

    def task_params
      params.require(:task).permit(:body)
    end
end
