Rails.application.routes.draw do
  resources :albums
  resources :photos do
    put 'favourite', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'albums#index'
end
