Rails.application.routes.draw do
  resources :cars
  resources :car_models
  resources :car_types

  resources :users do
    post :enable_disable
  end

  devise_for :users, path: ''
  # path: '' => nao deixa dar conflito de rotas no devise
end
