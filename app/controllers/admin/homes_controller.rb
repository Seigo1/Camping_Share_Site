class Admin::HomesController < ApplicationController
  # お問合せ一覧を兼ねる
  def top
    @contacts = Contact.all
  end
end
