class LoginController < ApplicationController
  def index
    # puts "--------------------Index"
    @user = User.new
  end
  def new

  end
end
