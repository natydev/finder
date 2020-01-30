# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CRUDHelper
  before_action :set_locale_based_on_browser
  before_action :context_icon

private

  # called inside each controller (or specific view) to set
  # a contextual icon class
  def context_icon
    @context_icon = nil
  end

  def set_locale_based_on_browser
    locale = extract_locale_from_accept_language_header

    I18n.locale =
      if locale_valid?(locale)
        locale
      else
        I18n.default_locale
      end
  end

  def locale_valid?(locale)
    I18n.available_locales.map(&:to_s).include?(locale)
  end

  def extract_locale_from_accept_language_header
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return unless accept_language

    accept_language.scan(/^[a-z]{2}/).first
  end
end
