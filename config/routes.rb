Eebulle::Application.routes.draw do

  root to: 'pages#home'

  %w[home presentation contact kidsbulle].each do |page|
    get page, to: "pages##{page}"
  end

  get '/medias', to: "galleries#index"

	get 'profile', to: "users#profile"
 	patch 'user/update', to: "users#update"
  get 'user/edit', to: "users#edit"
  get 'login', to: "sessions#new"
  delete 'signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :events, only: [:index]
  resources :activities, only: [:index]
  resources :messages, only: [:index]
  resources :newsletter_emails, only: [:new, :create]
  resources :galleries, only: [:show]

  namespace :admin do

  	resources :pages, only: [:index, :edit, :update]
  	resources :events, except: [:show]
  	resources :activities, except: [:show]
  	resources :users, except: [:show]
    resources :messages, except: [:show]
    resources :emails, only: [:new, :create]
    resources :newsletter_emails, except: [:show]
    resources :galleries, except: [:show] do
      resources :paintings, only: [:new, :create, :destroy]
    end

  end
end
