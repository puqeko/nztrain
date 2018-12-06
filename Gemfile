source 'http://rubygems.org'

gem 'rails'

gem 'nzic_models', github: 'NZOI/nzic_models'
#gem 'nzic_models', path: '../../nzic/nzic_models'

gem 'devise'
gem 'psych' # part of stdlib, need newer version for safe_load

# change back to cookie-based store (encrypted)
gem 'activerecord-session_store'

gem 'rubyzip'

gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 4.0'
gem 'jquery-historyjs'
gem 'superfish-rails'

gem 'forem', github: 'radar/forem', branch: 'rails4'
gem 'forem-redcarpet', github: 'NZOI/forem-redcarpet'

gem "nokogiri"
gem 'redcarpet'
gem 'rmagick'#, '2.13.2'
#gem 'rmagick'
gem 'carrierwave'
gem 'will_paginate'
gem 'has_scope'
gem 'pundit'
gem 'recaptcha', :require => 'recaptcha/rails'
gem 'loofah'
gem 'whenever', :require => false # for cron jobs
gem 'squeel'#, '~> 1.1.1' # until version 1.1.2 released
gem 'tilt'
gem 'simple-navigation'
gem 'simple_form'
gem 'facebox-rails'
gem 'strong_presenter'
gem 'render_anywhere'
gem 'pygments.rb'
gem 'ranked-model', :github => 'mixonic/ranked-model'
gem 'pdf-reader'
gem 'mechanize'
gem 'prawn'
gem 'rqrcode'
gem 'pdfkit'

gem 'countries'
gem 'country_select'
gem 'geocoder'
gem 'hive_geoip2'
gem 'world-flags'
gem 'jquery-final_countdown-rails'
gem 'ruby-duration'

gem 'pg', '< 1.0'
gem 'backup'

# Redis and Background Processing
gem 'redis'
gem 'rake' # pinned to avoid last_comment issue
gem 'qless' #, :github => 'ronalchn/qless', :branch => 'nztrain'
gem 'connection_pool'
gem 'sinatra'

# Deploy with Capistrano
# gem 'capistrano'

# Monitoring
gem 'newrelic_rpm'
gem 'coveralls', require: false

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'foreman'
  gem 'spring'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'rspec-rails'
  gem 'test-unit'
  gem 'capybara'
  gem 'capybara-email'

  gem 'factory_bot_rails'

  gem 'byebug'
  gem 'factory_bot'#, '~> 4.0'

  gem 'ruby_parser' # for declarative_authorization
end


# Gems used only for assets and not required  
# in production environments by default.  
#group :assets do  
gem 'sass'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'libv8'
gem 'therubyracer' # required for the execjs gem (dependency)
gem 'yui-compressor'
#end



