Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :rooms, only: [:create, :index, :show] do
        resources :messages, only: [:create, :index, :show]
      end
    end
  end
end
