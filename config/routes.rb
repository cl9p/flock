Flock::Application.routes.draw do
  devise_for :users do 
    get 'sign_out' => 'devise/sessions#sign_out' 
  end
    
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  
  devise_for :users
  resources :users
end