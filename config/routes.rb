RaceCalendar::Application.routes.draw do
  resources :races, only: :index
  resources :races, only: [:index, :create]
  namespace :api do
    resources :races, only: :create
  end
end
