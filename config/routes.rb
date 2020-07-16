Rails.application.routes.draw do
  resources :tickets, except: %i[index create show]
  resources :inactive_events, only: %i[destroy]
  root to: 'events#index'
  resources :events do
    member do
      post :add_inactive, to: 'inactive_events#create'
      post :add_ticket, to: 'tickets#create'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
