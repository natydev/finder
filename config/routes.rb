# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tags
  root to: "items#search"

  resources :items, only: [:index, :show]
  resources :boxes do
    resources :items
  end
  resources :places do
    resources :spots
  end

  resources :searches, only: [:index]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
