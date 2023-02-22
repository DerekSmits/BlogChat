# frozen_string_literal: true

Rails.application.routes.draw do
  post '/sign_in', to: 'authentication#login'
  resources :users, except: :index

  match '*path', to: 'errors#not_found', via: :all
end
