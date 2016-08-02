Rails.application.routes.draw do
  get 'questions/show'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get '/questions/:id', to: 'questions#show'
  get '/random', to: 'questions#random'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
