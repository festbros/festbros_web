Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'website#index'
  get '/auth/login', to: 'auth#login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/admin' , to: 'admin#create'
  get '/dashboard' , to: 'posts#index'
  get '/reg', to: "auth#reg"
  post '/regform' , to: 'website#regform'
  get '/livestream' , to: 'website#livestream'
  post '/destroypost' , to: 'posts#destroy'
  post '/Subscribe' , to: 'website#Subscribe'
  
  resources :posts do
  	resources :comments 
  end

  namespace 'api' do
    namespace 'v1' do
       #resources :links  
        get '/index' , to: 'links#index'
        get '/last' , to: 'links#last'
        post '/contact' , to: 'links#contact'
    end
  end
 
end
