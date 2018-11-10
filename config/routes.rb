Rails.application.routes.draw do
 
  
  get 'picture/new'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static_pages#home'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/news',  to:'static_pages#news'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update ,:destroy] 



  get 'event/new' 

  post 'event/create' 

  get 'event/index'
  get 'event/show'
  get 'event/update'
  get 'event/destroy'

  resources :event do
     post 'attend' ,on: :member
   end

 
  #resources :event_attendees, only: [:create, :destroy]
end
