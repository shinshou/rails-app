Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # rootは、localhost:3000にアクセスが来た場合のルーティングを意味する。
  #ここでは、localhost:3000にアクセスが来たらBoardsControllerクラスのindexメソッドを実行するように定義している。
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create destroy]
end
