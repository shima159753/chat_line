Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/show'
  devise_for :users
  get 'users/search', to: "users#search"
  resources :chats do
    get "time_show", on: :member
    collection do
      get 'search'
    end
  end
  root to: "chats#index"
end
