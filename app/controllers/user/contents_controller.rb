class User::ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def edit
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
  end

  def update
  end

  private

  def content_params
    params.require(:content).permit(:user_id, :genre_id, :name, :address, :introduction, :latitude, :longitude, :image, :review)
  end
end
