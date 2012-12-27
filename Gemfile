source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'jquery-rails'
gem 'pg'
gem 'slim'
gem "less-rails"
gem 'libv8'
gem 'therubyracer'
gem "nested_form", :git => 'https://github.com/ryanb/nested_form.git'
gem 'mail'
gem 'valid_email'

# Email database crypt:
gem 'attr_encrypted', :git => 'https://github.com/sysadm/attr_encrypted.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

# Upload
gem 'carrierwave'
gem 'rmagick'

# Authentication & authorization
gem 'sorcery'
gem 'cancan'

# Scheduler
gem "resque"
gem "resque-scheduler"
gem "resque-async-method"

# Use unicorn as the app server
gem 'unicorn'

# To use debugger
# gem 'debugger'
gem 'exception_notification_rails3', :require => 'exception_notifier', :group => :production

gem "rspec-rails", :group => [ :development, :test ]

group :development do
    gem 'thin'
    gem 'mailcatcher'
    gem 'capistrano'
    gem 'cape'
    gem 'capistrano-unicorn'
    gem "capistrano-ext"
    gem "capistrano_colors", :require => false
    gem 'rvm'
    gem 'rvm-capistrano'
    gem 'nifty-generators'
end

group :test do
  gem "resque_spec"
  gem "simplecov", :require => false
  gem "factory_girl"
  gem "factory_girl_rails"
  gem "cucumber-rails"
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'mocha'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
