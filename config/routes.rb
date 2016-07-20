Rails.application.routes.draw do
  root 'page#home'
  get 'home' => 'page#home'

  resources :recipes do
    member do
      post 'like'
    end
  end

  resources :chefs, except: :new

  get '/register', to: 'chefs#new', as: :chef_register

  get 'login' => 'logins#new'
  post 'login' => 'logins#create'
  get 'logout' => 'logins#destroy'

end
