Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :reservations
  resources :rooms
  

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    get '/users/account' => 'devise/registrations#show'
  end

 

  root to: "homes#top"
  resources :homes do
    get '/result' => 'homes#index'
    collection do
      get :search #ransack検索用
    end
  end
  
  
  resources :users, only: [:show, :edit, :update]

  
end