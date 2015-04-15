Rails.application.routes.draw do
  
  root 'issues#index'

  # devise_for :users
  devise_for :users, :path => 'supersecretwaduspath', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get 'pages/home'
  get 'pages/issue'

  get '/issues/:id/:public_id', to: 'reasons#show', as: 'reason'
    
  resources :issues do
    resources :reasons
    # get '/issues/:id/:public_id', to: 'reasons#show', as: 'reason_wadus'
  end

  resources :reasons do
    member do
      patch 'vote'
      patch 'unvote'
    end
  end
  
  resources :invites

end
