class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :following, :followers]
  PER = 5
  def index
    @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.recent.page(params[:page])
    @micropost = current_user.microposts.build
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end
end
