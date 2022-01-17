Rails.application.routes.draw do
  resources :users do
    post :enable_disable
  end

  devise_for :users, path: ''
  # path: '' => nao deixa dar conflito de rotas no devise
end
