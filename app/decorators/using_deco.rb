# frozen_string_literal: true

# Shred using string for Box and Item
module UsingDeco
  extend ActiveSupport::Concern

  def using_strike
    'using' if object.using?
  end
end
