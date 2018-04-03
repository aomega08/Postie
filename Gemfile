source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Server / Database
gem 'rails', '~> 5.2.0.rc2'
gem 'puma', '~> 3.11'
gem 'pg', '< 2.0'
gem 'bootsnap', require: false
gem 'mini_racer', platforms: :ruby

# Assets / Templating
gem 'slim-rails'
gem 'jbuilder'
gem 'sass-rails'
gem 'uglifier'

# Utilities
gem 'mail'
# gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
  gem 'listen', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
