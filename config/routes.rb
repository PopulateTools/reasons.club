Rails.application.routes.draw do
  
  root 'issues#index'

  # devise_for :users
  devise_for :users, 
    :path => 'login', 
    :path_names => {:sign_in => 'login', :sign_out => 'logout'},
    :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  
  resources :users, only: [:update, :finish_signup, :destroy]
  get '/me', to: 'users#me', :as => :user_profile
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get 'activity', to: 'activities#index'
  get 'pages/home'
  get 'pages/issue'


  # get '/issues/:id', to: 'issues#show', as: 'reason'
    
  resources :issues do
    resources :reasons
    # get '/issues/:id/:public_id', to: 'reasons#show', as: 'reason_wadus'
  end

  get 'reason/:id', to: 'reasons#show', as: 'reason_modal'
  match 'reason/:id', to: 'reasons#update', as: 'update_reason', via: [:put, :patch]

  resources :reasons do
    member do
      patch 'vote'
      patch 'unvote'
    end
  end
  
  resources :invites

end
