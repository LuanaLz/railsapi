Rails.application.routes.draw do
  # API routes path
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #devise_for :users
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :aeroportos
      resources :aeronaves
      resources :assentos
      resources :voos
      resources :passageiros
      resources :assento_voos

    end
  end
end
