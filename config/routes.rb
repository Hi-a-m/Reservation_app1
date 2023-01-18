Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    get '/users/account' => 'devise/registrations#show'
  end

  resources :users, only: [:show, :edit]

  resources :rooms

end

#devise_forはdeviseのヘルパーメソッドです。
#:モデル名を指定すると認証に必要なルーティングを自動で設定してくれます。
#この記述の追加と同時にマイグレーションファイルも作成されます。