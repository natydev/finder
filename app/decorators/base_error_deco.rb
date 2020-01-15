module BaseErrorDeco
  extend ActiveSupport::Concern

  def base_errors
    object.errors.messages[:base].to_sentence
  end

end
