Rails.application.routes.draw do
  
  root 'issues#index'

  # devise_for :users
  devise_for :users, :path => 'supersecretwaduspath', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get 'pages/home'
  get 'pages/issue'

  resources :reasons
  resources :issues do
    resources :reasons
  end

  resources :invites

end
