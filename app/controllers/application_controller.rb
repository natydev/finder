# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CRUDHelper
  before_action :context_icon

  private

    # called inside each controller (or specific view) to set
    # a contextual icon class
    def context_icon
      @context_icon = nil
    end
end
