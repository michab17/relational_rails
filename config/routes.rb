Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/zoos', to: 'zoos#index'
  get '/hotels', to: 'hotels#index'
  get '/zoos/new', to: 'zoos#new'
  get '/hotels/new', to: 'hotels#new'
  post '/zoos', to: 'zoos#create'
  post '/hotels', to: 'hotels#create'
  get '/zoos/:id', to: 'zoos#show'
  get '/hotels/:id', to: 'hotels#show'
  get '/animals', to: 'animals#index'
  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'
  get '/animals/:id', to: 'animals#show'
  get '/zoos/:id/animals', to: 'zoos#show_children'
  get '/hotels/:id/guests', to: 'hotels#show_children'
  get '/hotels/:id/edit', to: 'hotels#edit'
  get '/zoos/:id/edit', to: 'zoos#edit'
  patch '/zoos/:id', to: 'zoos#update'
  patch '/hotels/:id', to: 'hotels#update'
  get '/zoos/:id/animals/new', to: 'animals#new'
  get '/hotels/:id/guests/new', to: 'guests#new'
  post '/zoos/:id/animals', to: 'animals#create'
  post '/hotels/:id/guests', to: 'guests#create'
  get '/guests/:id/edit', to: 'guests#edit'
  get '/animals/:id/edit', to: 'animals#edit'
  patch '/animals/:id', to: 'animals#update'
  patch '/guests/:id', to: 'guests#update'
  get '/zoos/:id/animals', to: 'zoos#sorted_index'
  get '/hotels/:id/guests', to: 'hotels#sorted_index'
end