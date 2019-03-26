Rails.application.routes.draw do

  get '/hello', to: 'application#hello'
  post '/log_in', to: 'sessions#create'

  resources :users, only: [:create] do
    collection do
      get 'me'
    end
  end

end
