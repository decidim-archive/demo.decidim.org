lock "~> 3.10.0"

set :application, "demo.decidim.org"
set :repo_url, "https://github.com/decidim/demo.decidim.org"
set :deploy_to, "/var/www/demo.decidim.org"

set :passenger_restart_with_touch, true
set :rbenv_type, :user

append :linked_files, "config/application.yml", ".rbenv-vars"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
