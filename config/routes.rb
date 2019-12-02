# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "places#index"
  resources :places
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
