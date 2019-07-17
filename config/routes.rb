Rails.application.routes.draw do
  resources :photos do
    put 'favourite', on: :member
  end
  resources :albums
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'albums#index'
end
