class UsersController < ApplicationController
  def index
  end
  def create
    @user = params[:user]
    if User.find_by(email: @user[:email], password: @user[:password])
      @user_new = User.find_by(email: @user[:email])
      session[:user_email] = @user[:email]
      session[:user_id] = @user_new.id
      redirect_to '/events'
    else
      render plain: 'Error'
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def new
  end
end
