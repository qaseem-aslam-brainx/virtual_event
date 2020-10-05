class LoginController < ApplicationController
  def index
    @user = User.new
  end
  def new

  end
end
