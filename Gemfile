# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"

gem "puma", "~> 5.0"

gem "googleauth"
gem "omniauth-google-oauth2"

gem "devise"
gem "devise-jwt"
gem "rack-cors"

gem "redis", "~> 4.0"
gem "pg", "~> 1.1"

gem "active_model_serializers"
gem "pundit"

# gem "kredis"
# gem "image_processing", "~> 1.2"

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "figaro"
  gem "bullet"
  # gem "spring"
  gem "annotate"
end

group :test do
  gem "database_cleaner"
  gem "database_cleaner-active_record"
end
