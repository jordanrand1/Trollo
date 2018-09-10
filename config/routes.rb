Rails.application.routes.draw do
  devise_for :users
  root 'boards#index'

  resources :accounts
  resources :boards do
    resources :lists
  end

  scope 'lists/:list_id', as: 'list' do
   resources :tasks
 end
end
