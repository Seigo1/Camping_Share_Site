class Admin::ContentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contents = Content.all.order(created_at: :desc)
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def destroy
    @content = Content.find(params[:id])
    if @content.destroy
      redirect_to admin_contents_path, notice: '投稿を削除しました'
    else
      flash.now[:alert] = '投稿の削除に失敗しました'
      render :edit
    end
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to admin_content_path(@content.id), notice: '投稿の編集が完了しました'
    else
      flash.now[:alert] = '投稿の編集に失敗しました'
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:user_id, :genre_id, :name, :address, :introduction, :latitude, :longitude, :image, :review)
  end
end

