# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.24.2"

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION
#gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer/"

gem "puma", "~> 5.6"
gem "uglifier", "~> 4.1"
gem "wkhtmltopdf-binary", "~> 0.12"
gem "airbrake", "~> 5.0"
gem "faker", "~> 2.14"
gem "therubyracer", "~> 0.12"
gem "figaro", "~> 1.1"
gem "delayed_job_active_record", "~> 4.1"
gem "daemons", "~> 1.3"
gem "listen", "~> 3.1"
gem "letter_opener_web", "~> 1.3"

group :production do
  gem "secure_headers", "~> 6.1"
end

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"

  # deploy
  gem "capistrano", "~> 3.10"
  gem "capistrano-rails", "~> 1.3"
  gem "capistrano-bundler", "~> 1.3"
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-puma", "~> 5.0"
  gem "capistrano3-delayed-job", '~> 1.0'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end
