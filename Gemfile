source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use twitter-bootstrap
# gem 'bootstrap-sass', '~> 3.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'by_star', '~> 2.2', '>= 2.2.1' #date search

gem 'gon', '~> 6.0', '>= 6.0.1' #move ruby vars into js
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  ## gems for app
  # gem 'minitest-spec-rails'
  gem 'rspec-rails', '~> 3.4'
  gem 'rspec-collection_matchers', '~> 1.1', '>= 1.1.2'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda-matchers'
  # Pretty printed test output
  gem 'turn', :require => false
  
  gem 'passenger'
  gem 'guard'
  # gem 'guard-minitest'
  gem 'guard-rspec', require: false
  gem 'guard-passenger'
  gem "guard-bundler", "~> 2.0.0"
  gem 'rr', '~> 1.1.2'
  gem 'activerecord-nulldb-adapter'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'travis', '~> 1.7.4'
  gem 'awesome_print', :require => 'ap'
  gem 'dotenv-rails', '~> 2.0.2'
end

group :production do
  gem 'thin', '~> 1.6', '>= 1.6.4'
end

## app specific gems
# backend
gem 'rails_12factor', '~> 0.0.3'
gem 'rails_admin', '~> 0.7.0'
# gem 'paper_trail', '~> 4.0.0'

# authentication
gem 'devise', '~> 3.5', '>= 3.5.2'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'

# authorization
gem 'cancancan', '~> 1.13', '>= 1.13.1'

# asset upload
gem 'carrierwave', '~> 0.10.0'
gem 'rmagick', '~> 2.15', '>= 2.15.4'

# scheduling
gem 'ice_cube', '~> 0.13.3'

# frontend
# source 'https://rails-assets.org' do
#   gem 'rails-assets-bootstrap'
# end
gem 'high_voltage', '~> 2.4'


