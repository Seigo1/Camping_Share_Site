class Admin::ContentsController < ApplicationController
  def index
    @contents = Content.all
  end
end
