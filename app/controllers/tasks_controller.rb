class TasksController < ApplicationController
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(params[:task])
    @task.save
    respond_with(@task, :location => @list)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with(@task)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task, :location => @list)
  end
end
