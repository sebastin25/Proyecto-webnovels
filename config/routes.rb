Rails.application.routes.draw do
  resources :users
  resources :novelas do
    resources :capitulos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
