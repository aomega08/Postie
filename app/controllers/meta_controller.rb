# frozen_string_literal: true

# Provides behaviour for non-functional endpoints.
class MetaController < ApplicationController
  def ping
    render inline: 'PONG'
  end
end
