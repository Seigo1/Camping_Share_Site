class User::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite

  def create
    @content = Content.find(params[:content_id])
    @favorite = current_user.favorites.build(content_id: params[:content_id])
    @favorite.save
  end

  def destroy
    @content = Content.find(params[:content_id])
    @favorite = current_user.favorites.find_by(content_id: @content.id)
    @favorite.destroy
  end

  private
  def set_favorite
    @content = Content.find(params[:content_id])
  end
end
