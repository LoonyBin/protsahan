source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'haml-rails'
gem 'compass', :require => false
gem 'simple_form'

# Asset template engines
group :assets do
  gem 'sass-rails', '~> 3.1.0.rc'
  gem 'coffee-rails', '~> 3.1.0.rc'
  gem 'uglifier'
end

gem 'jquery-rails'

gem 'paper_trail'
gem 'inherited_resources'
gem 'rmagick'
gem 'fog'
gem 'carrierwave'
gem 'clearance'

gem 'hoptoad_notifier'

group :test, :development do
  gem 'sqlite3'

  gem 'passenger'

  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'steak'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 1.1'
  gem 'factory_girl_generator'
  gem 'guard-rspec'
  gem 'guard-livereload'
end
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# This is for heroku
group :production do
  gem 'therubyracer-heroku',  '0.8.1.pre3'
  gem 'thin'
  gem 'pg'
end
