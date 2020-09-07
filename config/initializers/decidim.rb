# frozen_string_literal: true

Decidim.configure do |config|
  config.application_name = "My Application Name"
  config.mailer_sender = "change-me@domain.org"

  # Change these lines to set your preferred locales
  config.default_locale = :en
  config.available_locales = [:en, :ca, :es]

  # Geocoder configuration
  if Rails.application.secrets.geocoder[:here_api_key]
    config.geocoder = {
      static_map_url: "https://image.maps.ls.hereapi.com/mia/1.6/mapview",
      here_api_key: Rails.application.secrets.geocoder[:here_api_key]
    }
  end

  # Custom resource reference generator method
  # config.reference_generator = lambda do |resource, feature|
  #   # Implement your custom method to generate resources references
  #   "1234-#{resource.id}"
  # end

  # Currency unit
  # config.currency_unit = "€"

  # The number of reports which an object can receive before hiding it
  # config.max_reports_before_hiding = 3

  # Custom HTML Header snippets
  #
  # The most common use is to integrate third-party services that require some
  # extra JavaScript or CSS. Also, you can use it to add extra meta tags to the
  # HTML. Note that this will only be rendered in public pages, not in the admin
  # section.
  #
  # Before enabling this you should ensure that any tracking that might be done
  # is in accordance with the rules and regulations that apply to your
  # environment and usage scenarios. This feature also comes with the risk
  # that an organization's administrator injects malicious scripts to spy on or
  # take over user accounts.
  #
  config.enable_html_header_snippets = false
end

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale

Decidim::Verifications.register_workflow(:mock_census_authorization_handler) do |auth|
  auth.form = "MockCensusAuthorizationHandler"
end
