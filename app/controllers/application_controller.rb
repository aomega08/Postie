# frozen_string_literal: true

# Shared behaviors for all the application controllers.
class ApplicationController < ActionController::Base
  include CorrelationId
end
