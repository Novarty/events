Rails.application.routes.draw do
  resources :events
  devise_for :users
  get 'tags/:tag', to: 'events#index', as: "tag"
  root "events#index"
end
