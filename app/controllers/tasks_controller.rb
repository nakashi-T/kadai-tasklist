class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクを作成しました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクを作成出来ませんでした"
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "タスクを編集しました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクを編集出来ませんでした"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "タスクを削除しました"
    # redirect_to tasks_url
    redirect_to tasks_url
  end
  
  public
  def task_params
    params.require(:task).permit(:content)
  end
end
