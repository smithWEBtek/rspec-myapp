Rails.application.routes.draw do
  get '/status', to: 'application#status'

  get '/pets', to: 'application#pets'

  get '/consoles', to: 'consoles#index'
end







