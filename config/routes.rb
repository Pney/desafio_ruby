Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "session#index"

  get 'session/index'    =>   'session#index',   as: :session
  post 'session/index'    =>   'session#sign',   as: :session_sign_in
  delete 'session/index'    =>   'session#destroy',   as: :session_logout
end
