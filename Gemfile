source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0.rc2'
gem 'puma', '~> 3.11'
gem 'pg', '< 2.0'
gem 'bootsnap', require: false
gem 'mini_racer', platforms: :ruby

gem 'slim-rails'
gem 'jbuilder'
gem 'sass-rails'
gem 'uglifier'

# gem 'mini_magick'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
