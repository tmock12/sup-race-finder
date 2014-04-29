RaceCalendar::Application.routes.draw do
  resources :races, only: :index
end
