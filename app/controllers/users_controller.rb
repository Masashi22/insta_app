class UsersController < ApplicationController
  PER = 5
  def index
    @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
    @micropost = current_user.microposts.build
  end
end
