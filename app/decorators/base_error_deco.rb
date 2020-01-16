module BaseErrorDeco
  extend ActiveSupport::Concern

  def base_errors
    object.errors.full_messages.to_sentence
  end

end
