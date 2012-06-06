Empl::Application.routes.draw do


  get "welcome/index"

  get "welcome/home"
  root :to => 'welcome#home'

  resources :mediums, :controller => :media
  resources :playlists
  resources :medium_infos
  resources :playlist_mediums, :controller => :playlist_media

  resources :passwords,
            :controller => 'auth/passwords',
            :only       => [:new, :create]

  resource  :session,
            :controller => 'auth/sessions',
            :only       => [:new, :create, :destroy]

  resources :users, :controller => 'auth/users', :only => [:new, :create] do
    resource :password,
             :controller => 'auth/passwords',
             :only       => [:create, :edit, :update]
  end

  match 'sign_up'  => 'auth/users#new', :as => 'sign_up'
  match 'sign_in'  => 'auth/sessions#new', :as => 'sign_in'
  match 'sign_out' => 'auth/sessions#destroy', :via => :delete, :as => 'sign_out'

end
