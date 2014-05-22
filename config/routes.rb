RaceCalendar::Application.routes.draw do
  resources :races, only: [:index, :create] do
    get 'list', on: :collection, as: :list
  end

  namespace :api do
    resources :races, only: :create
  end
end
