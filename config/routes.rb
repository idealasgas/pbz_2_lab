Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :technics_units
  resources :technics_repair_documents
  resources :employees
  resources :invoice
  resources :transfer_documents

  get '/new_repair_document/:id', to: 'technics_repair_documents#new_doc', as: 'new_repair_document'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
