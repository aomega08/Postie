# frozen_string_literal: true

# Shared behaviors for all API controllers.
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
end
