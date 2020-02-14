# frozen_string_literal: true
# Checks the authorization against a mock census for demo.
# This is only for testing how the verifications work on a staging server.
# DON'T use this for production
require "digest/md5"

# This class performs a fake check to test verifications on Decidim.
class MockCensusAuthorizationHandler < Decidim::AuthorizationHandler
  include ActionView::Helpers::SanitizeHelper
  include Virtus::Multiparams

  AVAILABLE_GENDERS = %w(man woman non_binary)

  attribute :document_number, String
  attribute :document_type, Symbol
  attribute :postal_code, String
  attribute :scope_id, Integer
  attribute :date_of_birth, Date
  attribute :gender, String

  validates :date_of_birth, presence: true
  validates :document_type, inclusion: { in: %i(dni nie passport) }, presence: true
  validates :document_number, format: { with: /\A[A-z0-9]*\z/ }, presence: true
  validates :postal_code, presence: true, format: { with: /\A[0-9]*\z/ }
  validates :scope_id, presence: true

  validate :over_14

  # If you need to store any of the defined attributes in the authorization you
  # can do it here.
  #
  # You must return a Hash that will be serialized to the authorization when
  # it's created, and available though authorization.metadata
  def metadata
    super.merge(
      date_of_birth: date_of_birth,
      gender: gender,
      postal_code: postal_code,
      scope: scope.name["ca"],
    )
  end

  def scope
    Decidim::Scope.find(scope_id)
  end

  def census_document_types
    %i(dni nie passport).map do |type|
      [I18n.t(type, scope: "decidim.mock_census_authorization_handler.document_types"), type]
    end
  end

  def unique_id
    Digest::MD5.hexdigest(
      "#{document_number&.upcase}-#{Rails.application.secrets.secret_key_base}"
    )
  end

  private

  def sanitized_document_type
    case document_type&.to_sym
    when :dni
      "01"
    when :passport
      "02"
    when :nie
      "03"
    end
  end

  def over_14
    errors.add(:date_of_birth, I18n.t("mock_census_authorization_handler.age_under", min_age: 14)) unless age && age >= 14
  end

  def age
    return nil if date_of_birth.blank?

    now = Date.current
    extra_year = (now.month > date_of_birth.month) || (
      now.month == date_of_birth.month && now.day >= date_of_birth.day
    )

    now.year - date_of_birth.year - (extra_year ? 0 : 1)
  end

end
