source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'mysql2'
gem 'capistrano'
gem 'rvm-capistrano'
gem 'therubyracer'
gem 'execjs'
gem 'gravatar_image_tag', '1.0.0'
gem 'friendly_id', '~> 4.0.0.beta14'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'geocoder', '1.1.1'
gem 'inherited_resources', '1.2.2'
gem 'redis', '2.2.2'
gem 'yajl-ruby'
gem 'active_attr'
gem 'rails-i18n'

group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'bootstrap-sass', '~> 2.0.1'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '2.8.1'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'sqlite3', '1.3.5'
end

group :development do
  gem 'faker'
  gem 'ruby-prof'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'letter_opener'
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
  gem 'fakeweb'
end
