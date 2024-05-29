Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :spots, only: %i[index show] do
    resources :reviews, module: :spots
  end

  resources :experiences, only: %i[index show] do
    resources :reviews, module: :experiences
  end

  resources :reviews, only: %i[new create index edit update destroy]
end
