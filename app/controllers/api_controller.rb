# frozen_string_literal: true

# Shared behaviors for all API controllers.
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound do
    render status: :not_found, json: {
      error: {
        code: 'INVALID_ID',
        title: 'The specified object ID is invalid or does not exist.'
      }
    }
  end
end
