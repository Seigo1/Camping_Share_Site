class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(params[:id])
    @contents = Content.where("user_id = #{id}")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: '編集が完了しました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :image, :is_active)
    end
end
