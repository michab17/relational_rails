Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/zoos', to: 'zoos#index'
  get '/hotels', to: 'hotels#index'
  get '/zoos/new', to: 'zoos#new'
  get '/hotels/new', to: 'hotels#new'
  post '/zoos', to: 'zoos#create'
  post '/hotels', to: 'hotels#create'
end