# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# tools
gem 'configatron', '~> 4.5.1'
gem 'enumerate_it', '3.0.0'

# Views
gem 'gretel', '3.0.9'
gem 'kaminari', '~> 1.1.1'
gem "bootstrap4-kaminari-views", "1.0.1"
gem 'simple_form', '5.0.1'
gem 'slim-rails', '~> 3.2.0'
gem 'cocoon', '1.2.14'
gem 'ransack', '2.3.0'
gem 'draper', '3.1.0'

# Localization
gem 'i18n-tasks', '~> 0.9.29'
gem 'rails-i18n', '~> 6.0.0'

# auth
gem 'devise', '4.7.1'
gem 'devise-bootstrap-views', '~> 1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'annotate', '~> 3.0.3'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '5.1.1'
  gem 'faker', '2.7.0'
  gem 'rspec-rails', '~> 3.9.0'
  gem 'rubocop-rails_config', '~> 0.3.1'
end

group :test do
  gem 'database_cleaner', '1.7.0'
  gem 'guard', '2.16.1'
  gem 'guard-rspec', '4.7.3', require: false
  gem 'simplecov', '0.17.1', require: false
  gem 'terminal-notifier-guard', '~> 1.7.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
