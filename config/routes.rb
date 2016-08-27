Rails.application.routes.draw do
  get 'questions/show'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  get '/questions/all', to: 'questions#all'
  get '/questions/new', to: 'questions#new'
  post '/questions', to: 'questions#create'
  get '/questions/:id', to: 'questions#show'
  get '/questions/:id/edit', to: 'questions#edit', as: 'choose'
  get '/random', to: 'questions#random'
  delete '/questions/:id/delete', to: 'questions#delete', as: 'delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
