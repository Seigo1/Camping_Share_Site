class Admin::HomesController < ApplicationController
  # お問合せ一覧を兼ねる
  def top
    @contacts = Contact.all.order(created_at: :desc)
  end
end
