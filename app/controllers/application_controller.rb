class ApplicationController < ActionController::Base
  before_action :set_search
  def set_search
    @search = User.ransack(params[:q])
    @search_user = @search.result.page(params[:page])
  end
end
