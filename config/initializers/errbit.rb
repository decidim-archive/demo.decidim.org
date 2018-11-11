# frozen_string_literal: true

Airbrake.configure do |config|
  config.host = Rails.application.secrets.airbrake[:host]
  config.project_id = 1 # required, but any positive integer works
  config.project_key = Rails.application.secrets.airbrake[:key]
  config.environment = Rails.env
  config.ignore_environments = %w(development test)
end
