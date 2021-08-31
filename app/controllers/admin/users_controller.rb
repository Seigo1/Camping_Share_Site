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
      redirect_to admin_user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(current_customer.id)
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :image, :is_active)
    end
end
