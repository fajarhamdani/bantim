Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'
  
  resources :desas do
  	resources :kelompoks, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
