class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comic
  def create
    @comic = Comic.find(params[:comic_id])
    favorite = @comic.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    favorite = current_user.favorites.find_by(comic_id: @comic.id)
    favorite.destroy
    redirect_to request.refere
  end
   private
   def set_comic
   @comic = Comic.find(params[:comic_id])
   end
end
