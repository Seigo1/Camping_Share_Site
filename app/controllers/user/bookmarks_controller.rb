class User::BookmarksController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_bookmark

  def create
    @content = Content.find(params[:content_id])
    @bookmark = current_user.bookmarks.build(content_id: params[:content_id])
    @bookmark.save
  end

  def destroy
    @content = Content.find(params[:content_id])
    @bookmark = current_user.bookmarks.find_by(content_id: @content.id)
    @bookmark.destroy
  end

  private
  def set_bookmark
    @content = Content.find(params[:content_id])
  end
end
