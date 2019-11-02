Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :technics_units
  resources :technics_repair_documents
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
