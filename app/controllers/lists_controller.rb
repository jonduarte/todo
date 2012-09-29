class ListsController < ApplicationController
  def index
    @lists = current_user.lists
    respond_with @lists
  end

  def public
    @lists = List.public_for current_user
    respond_with @lists
  end

  def show
    @list = current_user.lists.find(params[:id])
    @task = Task.new
    respond_with @list, @task
  end

  def new
    @list = List.new
    respond_with @list
  end

  def edit
    @list = current_user.lists.find(params[:id])
    respond_with @list
  end

  def create
    @list = current_user.lists.create(params[:list])
    respond_with @list, :location => @list
  end

  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with @list, :location => @list
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    respond_with @list, :location => lists_path
  end
end
