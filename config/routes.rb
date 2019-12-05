# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "items#search"

  resources :items do
    collection do
      get 'search'
    end
  end
  resources :boxes do
    resources :items
  end
  resources :places do
    resources :spots
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
