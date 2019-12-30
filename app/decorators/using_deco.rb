module UsingDeco
  extend ActiveSupport::Concern

  def using_strike
    'using' if object.using?
  end
end
