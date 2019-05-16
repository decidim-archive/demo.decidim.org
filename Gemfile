# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION
DECIDIM_VERSION = { git: "https://github.com/decidim/decidim", branch: "0.17-stable"}

gem "decidim", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION

gem "puma", "~> 3.0"
gem "uglifier", "~> 4.1"
gem "wicked_pdf"
gem "wkhtmltopdf-binary"
gem "airbrake", "~> 5.0"
gem "faker", "~> 1.8"
gem "therubyracer"
gem "figaro"

group :development, :test do
  gem "byebug", "~> 10.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
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
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-puma"
end
