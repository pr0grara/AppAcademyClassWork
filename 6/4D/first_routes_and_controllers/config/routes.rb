Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get 'users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # delete 'users/:id', to: 'users#destroy'
  # patch '/users/:id', to: 'users#update'
  # get 'users', to: 'users#index'
  # put 'users/:id', to: 'users#update'
  resources :users, except: [:edit, :new] do 
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  get 'artworks/:id', to: 'artworks#show'
  resources :artworks, except: [:edit, :show, :new, :index] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, except: [:edit, :new]
  resources :comments, only: [:create, :destroy]
  resources :likes, except: [:edit, :new]
end
