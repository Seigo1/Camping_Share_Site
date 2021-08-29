class User::ContentsController < ApplicationController
  def index
    @contents = Content.all.order(created_at: :desc)
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
    @genres = Genre.all
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to content_path(@content.id)
    else
      render :new
    end
  end

  def destroy
    @content = Content.find(params[:id])
    if @content.destroy
      redirect_to contents_path, notice: '投稿を削除しました'
    else
      render :edit
    end
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to content_path(@content.id), notice: '投稿の編集が完了しました'
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:user_id, :genre_id, :name, :address, :introduction, :latitude, :longitude, :content_image, :review)
  end
end
