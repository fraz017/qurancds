Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :categories, only: [:index, :show]
      resources :speakers, only: [:index, :show]
      resources :languages, only: [:index, :show]
      resources :cds, only: [:index, :show] do 
        member do 
          post 'feedback'
          get 'ratings'
          get 'tracks'
        end
      end
      resources :tracks, only: [:show, :destroy]
    end
  end
end
