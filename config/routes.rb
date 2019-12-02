# frozen_string_literal: true

Rails.application.routes.draw do
  resources :spots
  root to: "places#index"
  resources :places do
    resources :spots
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
