source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.0.4"
gem "sqlite3"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", "3.2.0.0"
gem "font-awesome-rails"
gem "devise"
gem "faker"
gem "carrierwave", "~> 1.0"
gem "mini_magick", "3.8.0"
gem "kaminari"
gem "config"
gem "bootstrap-kaminari-views"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"

source "https://rails-assets.org/" do
  gem "rails-assets-adminlte"
end

group :development, :test do
  gem "byebug", platform: :mri
  gem "pry"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
