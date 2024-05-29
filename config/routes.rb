Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :spots, only: %i[index show] do
    resources :bookmarks, only: %i[index new create destroy]
  end
end
