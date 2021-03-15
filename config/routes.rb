Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/show'
  devise_for :users
  resources :chats
end
