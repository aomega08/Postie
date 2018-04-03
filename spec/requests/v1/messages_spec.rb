# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages API v1', type: :request do
  describe 'POST /' do
    let(:message_data) do
      {
        from: Faker::Internet.email,
        recipients: [
          {
            email: Faker::Internet.email
          }
        ]
      }
    end

    context 'when all needed parameters are provided' do
      it 'responds with OK (200)' do
        post '/v1/messages', params: { data: message_data }
        expect(response.code.to_i).to be 201
      end
    end
  end

  describe 'GET /' do
    it 'responds with 200 (OK)' do
      get '/v1/messages'
      expect(response.code.to_i).to be 200
    end
  end

  describe 'GET /{id}' do
    context 'when the id references an existing message' do
      it 'responds with OK (200)' do
        message = FactoryBot.create(:message)

        get "/v1/messages/#{message.id}"
        expect(response.code.to_i).to be 200
      end
    end

    context 'when the id is invalid' do
      it 'responds with 404 (Not Found)' do
        get '/v1/messages/_invalid_'
        expect(response.code.to_i).to be 404
      end
    end
  end

  describe 'GET /{id}/content' do
    context 'when the id references an existing message' do
      it 'responds with OK (200)' do
        message = FactoryBot.create(:message)

        get "/v1/messages/#{message.id}/content"
        expect(response.code.to_i).to be 200
      end
    end

    context 'when the id is invalid' do
      it 'responds with 404 (Not Found)' do
        get '/v1/messages/_invalid_/content'
        expect(response.code.to_i).to be 404
      end
    end
  end
end
