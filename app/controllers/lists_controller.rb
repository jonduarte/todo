class ListsController < ApplicationController
  def index
    @lists = current_user.lists
    respond_with @lists
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
    respond_with @list, @task
  end

  def new
    @list = List.new
    respond_with @list
  end

  def edit
    @list = List.find(params[:id])
    respond_with @list
  end

  def create
    @list = current_user.lists.create(params[:list])
    respond_with @list, :location => @list
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with @list, :location => @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_with nil, :location => lists_path
  end
end
