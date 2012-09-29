class TasksController < ApplicationController
  def create
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.create(params[:task])
    respond_with(@task, :location => @list)
  end

  def update
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.toggle! :done
    respond_with(@task, :location => @list)
  end

  def destroy
    @list = current_user.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    respond_with(@task, :location => @list)
  end
end
