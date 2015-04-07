Rails.application.routes.draw do
  
  root 'issues#index'

  devise_for :users
  get 'pages/home'
  get 'pages/issue'

  resources :reasons
  resources :issues do
    resources :reasons
  end

  resources :invites

end
