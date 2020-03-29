Rails.application.routes.draw do

  devise_for :employees, controllers: { passwords: :passwords, registrations: :employees }, skip: [:registrations]

  devise_scope :employee do
    get  'signup'  => 'devise/registrations#new',    as: :new_employee_registration
    post 'signup'  => 'devise/registrations#create', as: :employee_registration
    put  'signup'  => 'devise/registrations#update', as: :update_employee_registration
    get  'account' => 'devise/registrations#edit',   as: :edit_employee_registration
  end

  root to: 'home#index'
  
  get 'home/time_register', action: :time_register, controller: :home

  resources :employees
  resources :home

  resources :time_registers
end
