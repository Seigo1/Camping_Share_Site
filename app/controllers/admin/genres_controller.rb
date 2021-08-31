class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      redirect_to admin_genres_path, notice: 'ジャンル登録が完了しました'
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'ジャンル編集が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      redirect_to admin_genres_path, notice: 'ジャンル登録が完了しました'
    else
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end
end
