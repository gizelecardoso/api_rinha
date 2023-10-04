Rails.application.routes.draw do
  resources :pessoas, only: [:index, :show, :create]

  get '/contagem-pessoas', to: 'pessoas#contagem_pessoas'
end
