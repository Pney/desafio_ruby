Rails.application.routes.draw do
  

  resources :to_dos, except: [:new, :index, :edit]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get      'session/index'               =>   'session#index',               as: :session
  post     'session/index'               =>   'session#create',              as: :session_sign_in
  delete   'session/index'               =>   'session#logout',              as: :session_logout

  get      'user_profile/index'          =>   'user_profile#index',          as: :user_profile

  post     'to_dos_edit_status_right'    =>   'to_dos#edit_status_left',     as: :edit_to_do_status_left
  post     'to_dos_edit_status_left'     =>   'to_dos#edit_status_right',    as: :edit_to_do_status_right
  get      'to_dos_edit/:id'             =>   'to_dos#edit',                 as: :edit_to_do
  match    'to_dos_index'                =>   'to_dos#index',                via: [:get, :post]
  
  get      'to_do/new'                   =>   'to_dos#new',                  as: :new_to_do
  post     'status_list/new'             =>   'status_list#new',             as: :new_status_list
  root to: "session#index"
end
