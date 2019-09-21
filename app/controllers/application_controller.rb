class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:my_page, :index, :show]
end
