class User::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # 確認画面を作成する場合はこのような記述になるかと思います。
  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行します。
  def confirm
    @contact = Contact.new(contact_params)

  end

  # 入力内容に誤りがあった場合
  # backアクションを定義し
  # 入力内容を保持したまま前のページに戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 入力内容を保存する。
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # メールを送信する（今回は行わない）
      # ContactMailer.send_mail(@contact).deliver_now
      redirect_to thanks_path
    else
      render :new
    end
  end

  # 送信完了画面を使用する場合お使いください。
  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit( :name, :email, :phone_number, :subject, :message )
  end
end
