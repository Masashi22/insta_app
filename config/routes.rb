Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get 'my_page', :to => 'users/registrations#my_page'
  end

  root 'static_pages#home'
end
