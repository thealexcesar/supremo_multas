Rails.application.routes.draw do
  resources :users

  devise_for :users, path: ''
  # path: '' => nao deixa dar conflito de rotas no devise
end
