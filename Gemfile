source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'pry'
  gem 'debugger'
  gem 'better_errors'
  gem 'mailcatcher'
  gem 'binding_of_caller'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end

gem 'haml'
gem 'devise'
gem 'httparty'
gem 'delayed_job_active_record'
gem 'timecop'
gem 'hirb'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  # Foundation gems
  gem 'compass-rails'
  gem 'zurb-foundation'
  gem 'foundation-icons-sass-rails'
end

gem 'jquery-rails'
