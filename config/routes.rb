Rails.application.routes.draw do
  resources :employees
  
  root to: 'stack#index'

  get ':page' => 'stack#show', as: 'stack'
end
