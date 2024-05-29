Rails.application.routes.draw do
  get 'links/new'
  get 'links/create'
  devise_for :users
  root to: "pages#home"

  resources :spots, only: %i[index show] do
    resources :bookmarks, only: %i[index new create destroy]
    resources :reviews, only: %i[new create index edit update destroy]
    resources :visits, only: %i[new create destroy]
    resources :links, only: %i[new create destroy]
  end

  resources :experiences, only: %i[index show] do
    resources :reviews, only: %i[new create index edit update destroy]
  end
end
