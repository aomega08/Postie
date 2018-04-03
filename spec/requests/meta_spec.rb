# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Meta API', type: :request do
  describe '/meta/ping' do
    it 'is successful' do
      get '/meta/ping'
      expect(response.code.to_i).to eq 200
    end

    it 'responds with PONG' do
      get '/meta/ping'
      expect(response.body).to eq 'PONG'
    end
  end
end
