class User::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite

  def create
    @content = Content.find(params[:content_id])
    @favorite = current_user.favorites.new(content_id: @content.id)
    @favorite.save
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:content_id])
    favorite = current_user.favorites.find_by(content_id: @content.id)
    favorite.destroy
    redirect_to content_path(@content)
  end

  private
  def set_favorite
    @content = Content.find(params[:content_id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :content_id)
  end
end
