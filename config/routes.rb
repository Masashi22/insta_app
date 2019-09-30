Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  resources :users, :only => [:index, :show]
  resources :microposts, :only => [:new, :create, :destroy, :show]
  root 'static_pages#home'
end
