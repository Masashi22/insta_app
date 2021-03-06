source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'
gem 'rails', '~> 5.2.3'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'gravtastic'
gem 'faker'
gem 'kaminari'
gem 'cancancan'
gem 'rails_admin'
gem 'config'
gem 'carrierwave'
gem 'mini_magick'
gem 'jquery-rails'
gem 'ransack'
gem 'mysql2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rubocop-airbnb'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-email'
  gem 'email_spec'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
