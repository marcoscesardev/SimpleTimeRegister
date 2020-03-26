source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

# Backend
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'

# Front
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'rails-assets-bootstrap', ">= 4.0.0.alpha.2", source: "https://rails-assets.org"
gem 'rails-assets-tether'
gem 'sprockets-rails', '2.3.3'

# Authentication and security
gem 'devise'
gem 'devise_custom_authenticatable'
gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  # Debbug tools
  gem 'better_errors', '~> 2.5'
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3'

  # Generate fake data to test
  gem 'faker', '~> 1.9'

  # Run development server
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
