Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :create, :show]
    end
  end

  resources :users, param: :username
  post '/auth/login', to: 'authentication#login'
end
