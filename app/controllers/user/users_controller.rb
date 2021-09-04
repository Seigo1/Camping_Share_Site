class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(params[:id])
    @contents = Content.where("user_id = #{id}")
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '編集が完了しました！'
    else
      flash.now[:alert] = '編集内容を確認してください'
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
      redirect_to root_path, notice: '退会が完了しました。ご利用ありがとうございました'
    else
      flash.now[:alert] = '退会が正常に行われませんでした'
      render :unsubscribe
    end
  end

    private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active)
  end

end
