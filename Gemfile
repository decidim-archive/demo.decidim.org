# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", "0.14.1"

gem "puma", "~> 3.0"
gem "uglifier", "~> 4.1"

gem "faker", "~> 1.8"
gem "therubyracer"

group :development, :test do
  gem "byebug", "~> 10.0", platform: :mri

  gem "decidim-dev", "0.14.1"
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"

  # deploy
  gem "capistrano", "~> 3.10"
  gem "capistrano-rails", "~> 1.3"
  gem "capistrano-bundler", "~> 1.3"
  gem "capistrano-passenger"
  gem "capistrano-rbenv", "~> 2.1"
end
