source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'redis', '~> 4.0'

gem 'local_time'

gem 'devise'
gem 'devise_invitable'
gem 'rolify'

gem 'cancancan'

gem 'immutable-struct'

gem 'sidekiq'
gem 'sinatra', require: nil

gem 'gravatar_image_tag'

gem 'money-rails'

gem 'slack-notifier'



gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri]
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'simplecov', :require => false, :group => :test
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "letter_opener"
  gem 'foreman'
end

gem 'rack-cors', :require => 'rack/cors'