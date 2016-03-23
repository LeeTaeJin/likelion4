Rails.application.routes.draw do

  get 'admin/main'

  devise_for :users
  # root :to => "home#main"
  
  root 'home#main'
  match ":controller(/:action(/:id))", :via => [:post, :get]
  
  
end
