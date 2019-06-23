Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups do
    resources :topics, shallow: true do
      get :subscribers
      resources :messages
    end
  end

  # resources :topics do
  #   resources :messages, on: :member
  # end

  resources :users do
    resources :subscriptions

    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end

  # root '/'
end
