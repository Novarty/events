Rails.application.routes.draw do
  devise_for :users
  resources :events, only: %i[new show create index]
  resources :members, only: :create
  get 'tags/:tag', to: 'events#index', as: "tag"
  root "events#index"
end
