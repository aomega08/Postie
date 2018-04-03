# frozen_string_literal: true

module V1
  # Handles the CRUD operations for messages
  class MessagesController < ApiController
    def index
      query = Message.includes(:recipients, :tags)
                     .order(created_at: :desc)
                     .limit(index_limit)

      render locals: {
        messages: query
      }
    end

    def create
      message = Message.new(message_params)
      message.build_recipients(params.require(:data).require(:recipients))

      if message.save
        render :show, locals: { message: message }, status: :created
      else
        head :bad_request
      end
    end

    def show
      message = Message.find(params[:id])

      render locals: {
        message: message
      }
    end

    def content
      message = Message.find(params[:id])

      render locals: {
        message: message
      }
    end

    private

    def message_params
      params.require(:data).permit(:from, :from_name, :subject, :content, :html_content, :headers)
    end

    def index_limit
      n = params[:limit].to_i
      n = 100 if n.zero?
      n > 1000 ? 1000 : n
    end
  end
end
