Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/zoos', to: 'zoos#index'
  get '/zoos/new', to: 'zoos#new'
  post '/zoos', to: 'zoos#create'
  get '/zoos/:id', to: 'zoos#show'
  get '/zoos/:id/edit', to: 'zoos#edit'
  patch '/zoos/:id', to: 'zoos#update'
  delete '/zoos/:id', to: 'zoos#destroy'

  get '/animals', to: 'animals#index'
  get '/animals/:id', to: 'animals#show'
  get '/zoos/:id/animals/new', to: 'animals#new'
  post '/zoos/:id/animals', to: 'animals#create'
  get '/animals/:id/edit', to: 'animals#edit'
  patch '/animals/:id', to: 'animals#update'
  delete '/animals/:id', to: 'animals#destroy'

  get '/hotels', to: 'hotels#index'
  get '/hotels/new', to: 'hotels#new'
  post '/hotels', to: 'hotels#create'
  get '/hotels/:id', to: 'hotels#show'
  get '/hotels/:id/edit', to: 'hotels#edit'
  patch '/hotels/:id', to: 'hotels#update'
  delete '/hotels/:id', to: 'hotels#destroy'

  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'
  get '/hotels/:id/guests/new', to: 'guests#new'
  post '/hotels/:id/guests', to: 'guests#create'
  get '/guests/:id/edit', to: 'guests#edit'
  patch '/guests/:id', to: 'guests#update'
  delete '/guests/:id', to: 'guests#destroy'

  get '/zoos/:id/animals', to: 'zoo_animals#index'

  get '/hotels/:id/guests', to: 'hotel_guests#index'
end