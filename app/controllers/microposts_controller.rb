class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました！"
      redirect_to user_path(id: current_user.id)
    else
      flash.now[:alert] = "投稿できませんでした"
      render "static_pages/home"
    end
  end

  def destroy
    @micropost = Micropost.find_by(id: params[:id])
    if @micropost
      @micropost.destroy
      flash[:success] = "削除しました。"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def show
    @micropost = Micropost.find_by(id: params[:id])
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
end
