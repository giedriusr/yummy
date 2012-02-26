source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'mysql2'
gem 'capistrano'
gem 'therubyracer'
gem 'execjs'
gem 'gravatar_image_tag'
gem 'friendly_id', '~> 4.0.0.beta14'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'geocoder'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '2.8.1'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :development do
  gem 'faker'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'ruby-prof'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'launchy', '2.0.5'
  gem 'factory_girl_rails', '1.7.0'

  # because newer version of guard is not working properly, we need to specify
  # concrete versions of each gem
  gem 'guard', '0.8.8'
  gem 'spork', '~> 1.0rc'
  gem 'guard-rspec', '0.5.8'
  gem 'guard-spork', '0.3.2'
end