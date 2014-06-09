RaceCalendar::Application.routes.draw do
  resources :races do
    get 'list', on: :collection, as: :list
    get 'inactive', on: :collection, as: :inactive
  end

  resources :classifieds

  resources :classified_messages, only: :create

  namespace 'admin' do
    resources :races, only: [:edit, :update, :destroy] do
      get 'activate', action: :activate
    end
  end

  resource :dashboard, only: :show

  get '/sign_in', to: 'sessions#new'
  resource :sessions, only: [:new, :create]

  namespace :api do
    resources :races, only: :create
  end

  root 'races#index'
end
