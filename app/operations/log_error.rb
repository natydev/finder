# frozen_string_literal: true

# Raise an error and log it when owner mismatching
module LogError
  def owner_log_error
    log_error(ActiveRecord::AttributeAssignmentError,
              'Record is not belongs to current owner')
  end

  def log_error(klass_error, msg)
    Rails.logger.fatal "!!! #{msg} at #{Time.current.to_formatted_s}"
    Failure(raise(klass_error, msg))
  end
end
