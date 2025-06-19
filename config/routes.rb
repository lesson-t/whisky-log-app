Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  get 'whiskies/index'
  get 'whiskies/show'
  get 'whiskies/new'
  get 'whiskies/edit'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "whiskies#index"

  get 'mypage', to: 'users#mypage'
  # get 'users/:id/favorites', to: 'users#favorites', as: :user_favorites
  get 'favorites', to: 'favorites#index', as: :favorites

  get 'tags/:tag', to: 'whiskies#tagged', as: :tag

  resources :whiskies do
    resource :favorite, only: [:create, :destroy]
    member do
      delete 'remove_image/:image_id', to: 'whiskies#remove_image', as: 'remove_image'
    end
  end
end
