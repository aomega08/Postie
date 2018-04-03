# frozen_string_literal: true

Rails.application.routes.draw do
  scope path: '/meta', controller: :meta do
    get :ping
  end

  namespace :v1, defaults: { format: :json } do
    resources :messages, only: %i[index create show] do
      get :content, on: :member
    end
  end
end
