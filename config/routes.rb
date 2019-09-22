Rails.application.routes.draw do
  devise_for :users
  root to: "clock_events#index"
  resources :clock_events, except: [:new, :show]
end
