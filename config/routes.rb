Rails.application.routes.draw do

  namespace :api do
    resources :tests
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'static/access_denied'
  devise_for :users
  resources :users
  resources :tests

  namespace :api, defaults: {format: :json} do
    resources :tests do
      member do
        post 'result'
      end
    end
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions:  'api/sessions'
    }
    # devise_scope :user do
    #   post "sign_in", to: "sessions#create"
    # end
  end
end
