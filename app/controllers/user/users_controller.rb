class User::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.update(is_active: "無効")
      reset_session
      redirect_to root_path
    else
      render :unsubscribe
    end
  end

    private
  def user_params
    params.require(:user).permit(:name, :introduction, :image_id, :is_active)
  end

end
