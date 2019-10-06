Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  resources :users, :only => [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :microposts, :only => [:new, :create, :destroy, :show, :index]
  resources :relationships, :only => [:create, :destroy]
  root 'static_pages#home'
end
