Rails.application.routes.draw do
    resources :users
    resources :articles
    resources :likes

   root to: "users#sign_in"

   # get '/pins', to: 'pins#index'
   # post '/pins', to: 'pins#create'
   # Might call this a "save" instead of a like
   get '/likes', to: 'likes#create'
   # get '/likes/:id', to: 'likes#destroy'
   # post '/likes', to: 'likes#create'

   get '/sign_in', to: 'users#sign_in'
   post '/sign_in', to: 'users#sign_in!'
   get '/sign_up', to: 'users#sign_up'
   post '/sign_up', to: 'users#sign_up!'
   get '/sign_out', to: 'users#sign_out'

end
