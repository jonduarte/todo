class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(params[:task])
    respond_with(@task, :location => @list)
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.toggle! :done
    respond_with(@task, :location => @list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task, :location => @list)
  end
end
