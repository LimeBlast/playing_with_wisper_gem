Rails.application.routes.draw do
  resources :presentations,
            only: [:show, :new, :create]
end
