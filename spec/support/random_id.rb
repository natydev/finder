# frozen_string_literal: true

module RandomId
  def rand_id
    SecureRandom.uuid
  end
end
