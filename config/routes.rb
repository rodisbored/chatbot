Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups, only: [:index, :create, :update] do
    resources :topics, shallow: true do
      get :subscribers
      resources :messages
    end
  end

  resources :users, except: :destroy do
    resources :subscriptions, shallow: true, only: [:index, :create, :destroy]

    post '/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end
end
