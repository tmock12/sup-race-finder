RaceCalendar::Application.routes.draw do
  resources :races, only: [:index, :create] do
    get 'list', on: :collection, as: :list
  end

  get '/sign_in', to: 'sessions#new'
  resource :sessions, only: [:new, :create]

  namespace :api do
    resources :races, only: :create
  end

  root 'races#index'
end
