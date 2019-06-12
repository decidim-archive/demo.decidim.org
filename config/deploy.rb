lock "~> 3.11.0"

set :application, "demo.decidim.org"
set :repo_url, "https://github.com/decidim/demo.decidim.org"
set :deploy_to, "/home/ruby-data/app"

set :rbenv_type, :user

append :linked_files, "config/application.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

set :puma_bind, "tcp://0.0.0.0:3000"

