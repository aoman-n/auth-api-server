Rails.application.routes.draw do

  get '/hello', to: 'application#hello'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:create] do
    collection do
      get 'me'
    end
  end

end
