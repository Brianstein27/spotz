Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  post "search_spots", to: "search#search_spots"
  post "search_experiences", to: "search#search_experiences"
  post "search_bookmarks", to: "search#search_bookmarks"

  get "pages/profile", to: "pages#profile"

  get "pages/settings", to: "pages#settings"

  resources :bookmarks, only: %i[index destroy]
  resources :visits, only: %i[destroy]
  resources :reviews, only: %i[edit update destroy]
  resources :links, only: %i[new create destroy]

  get "filter", to: "spots#filter_categories"

  resources :spots, only: %i[index show] do
    get "options", to: "spots#options"
    resources :bookmarks, only: %i[create]
    resources :visits, only: %i[create]
    resources :reviews, only: %i[new create index]
    resources :links, only: %i[new create]
    resources :experiences, only: %i[index]
  end

  resources :experiences, only: %i[index show new create edit destroy] do
    resources :reviews, only: %i[new create index]
    resources :links, only: %i[new create]
  end
end
