Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get      'session/index'      =>   'session#index',       as: :session
  post     'session/index'      =>   'session#create',      as: :session_sign_in
  delete   'session/index'      =>   'session#logout',      as: :session_logout
  
  root to: "session#index"
end
