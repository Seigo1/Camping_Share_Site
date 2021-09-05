class User::HomesController < ApplicationController

  def top
    @contents = Content.all
  end
end
