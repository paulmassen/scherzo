Rails.application.routes.draw do
  #get 'ficheinfo' => 'artistes#ficheinfo'
#  get '/artistes/:id/ficheinfo', to: 'artistes#ficheinfo', as: 'artiste'
  get  'artistes(/:id)/printfiche', to: 'artistes#printfiche'
  resources :artistes
  get '/dashboard' => 'dashboard#dashboard'
  get '/calendar' => 'calendar#calendar'
  get '/settings' => 'settings#main'
  get 'engagements(/:id)/print', to: 'engagements#print'
  resources :engagements 
  resources :programmes
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
