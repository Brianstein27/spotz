Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :spots, only: %i[index show] do
    resources :bookmarks, only: %i[index new create destroy]
    resources :reviews, only: %i[new create index edit update destroy]
    resources :visits, only: %i[new create]
  end

  resources :experiences, only: %i[index show] do
    resources :reviews, only: %i[new create index edit update destroy]
  end
end
