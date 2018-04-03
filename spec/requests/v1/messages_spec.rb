# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages API v1', type: :request do
  describe '/v1/messages' do
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
      it 'is successful' do
        post '/v1/messages', params: { data: message_data }
        expect(response.code.to_i).to be 201
      end
    end
  end
end
