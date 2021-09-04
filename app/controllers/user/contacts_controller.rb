class User::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行します。
  def confirm
    @contact = Contact.new(contact_params)

  end

  # backアクション
  # 入力内容を保持したまま前のページに戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # メールを送信する（今回は行わない）
      # ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanks_path
    else
      flash.now[:alert] = '送信に失敗しました'
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit( :name, :email, :phone_number, :subject, :message )
  end
end
