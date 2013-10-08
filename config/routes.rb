Flock::Application.routes.draw do

  devise_for :users do 
    get 'sign_out' => 'devise/sessions#sign_out' 
  end
  
  #route authenticated users to this page by default  
  authenticated :user do
    root :to => 'projects#index'
  end
  
  #this is the default route for all users
  root :to => "projects#index"
  
  devise_for :users
  devise_for :projects
  devise_for :templates
  
  resources :users
  resources :projects
  resources :templates
end