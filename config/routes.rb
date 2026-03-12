Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
    end
  end
  get 'home/index'
  post 'TokenGeneration', to: 'home#token_generation', as: 'token_generation'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end