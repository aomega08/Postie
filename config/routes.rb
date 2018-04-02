# frozen_string_literal: true

Rails.application.routes.draw do
  scope path: '/meta', controller: :meta do
    get :ping
  end
end
