Rails.application.routes.draw do
  devise_for :employee, :controllers => { :sessions => "sessions" }

  devise_scope :employee do 
    get 'register', to: 'devise/sesssions#new', as: :register
    get 'logout', to: 'devise/sesssions#destroy', as: :logout
  end
  
  root to: 'stack#index'

  resources :employees

  get ':page' => 'stack#show', as: 'stack'
end
