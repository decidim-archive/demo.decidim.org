server "prod-decidim-try", user: "ruby-data", roles: %w{app db web}
set :branch, "master"
set :rails_env, "production"
