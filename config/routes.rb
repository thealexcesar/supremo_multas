Rails.application.routes.draw do
  root "fines#index"
  resources :car_models
  resources :car_types
  resources :companies
  resources :fine_points

  resources :cars do
    post :enable_disable
  end
  resources :fines do
    post :identified_unidentified
  end
  resources :users do
    post :enable_disable
  end

  devise_for :users, path: ''
  # path: '' => nao deixa dar conflito de rotas no devise
end
