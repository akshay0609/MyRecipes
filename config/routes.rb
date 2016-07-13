Rails.application.routes.draw do
  root 'page#home'
  get 'home' => 'page#home'

  resources :recipes
end
