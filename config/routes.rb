Rails.application.routes.draw do
  # Definisce le rotte per le azioni CRUD della risorsa `ingredienti`
  resources :ingredienti

  resources :clienti

  resources :ricette

  resources :ordini 

  # Definisce la root path route ("/")
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
