# frozen_string_literal: true

module V1
  # Handles the CRUD operations for messages
  class MessagesController < ApiController
    def create
      message = Message.new(message_params)
      message.build_recipients(params.require(:data).require(:recipients))

      if message.save
        render locals: { message: message }, status: :created
      else
        head :bad_request
      end
    end

    private

    def message_params
      params.require(:data).permit(:from, :from_name, :subject, :content, :html_content, :headers)
    end
  end
end
