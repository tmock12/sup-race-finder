RaceCalendar::Application.routes.draw do
  resources :races, only: :index
  namespace :api do
    resources :races, only: :create
  end
end
