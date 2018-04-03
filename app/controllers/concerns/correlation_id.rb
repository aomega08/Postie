# frozen_string_literal: true

# Stores or generates a Correlation ID based on the X-Correlation-Id HTTP header
# or the correlation_id request parameter.
# The Correlation ID is then made available in the RequestStore.
module CorrelationId
  extend ActiveSupport::Concern

  included do
    prepend_before_action :load_correlation_id
  end

  def correlation_id
    RequestStore[:correlation_id] || load_correlation_id
  end

  private

  def load_correlation_id
    id = request.headers['X-Correlation-Id'].presence || request.params[:correlation_id].presence
    RequestStore[:correlation_id] = id || SecureRandom.uuid
  end
end
