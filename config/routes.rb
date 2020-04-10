Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  
  resources :posts, except: :index do
    get 'permissions', on: :member

    resources :users, only: %i(new create)
  end

end
