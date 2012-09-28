class FavoritesController < ApplicationController
  def index
    @lists = current_user.favorites
    respond_with(@lists)
  end

  def update
    @list = List.find(params[:id])
    current_user.favorites << @list
    respond_with @list, :location => favorites_path
  end

  def destroy
    @list = List.find(params[:id])
    current_user.favorites.delete @list
    respond_with nil, :location => favorites_path
  end
end
