Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get 'my_page', :to => 'users/registrations#my_page'
  end

  resources :users, :only => [:index, :show]
  root 'static_pages#home'
end
