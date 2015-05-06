Rails.application.routes.draw do
  root to: 'pages#home'

  %w[home presentation contact kidsbulle broadcast fribourg romont shiloa vision financement profile].each do |page|
    get page, to: "pages##{page}"
  end

  get '/medias', to: "galleries#index"

  resources :events, only: [:index]
  resources :activities, only: [:index]
  resources :messages, only: [:index]
  resources :newsletter_emails, only: [:new, :create]
  resources :galleries, only: [:show]
  resources :downloads, only: [:index]

  namespace :admin do

    get 'files', to: "statics#files"

    resources :pages, only: [:index, :edit, :update]
    resources :events, except: [:show]
    resources :activities, except: [:show]
    resources :messages, except: [:show]
    resources :emails, only: [:new, :create]
    resources :newsletter_emails, except: [:show]
    resources :galleries, except: [:show] do
      resources :paintings, only: [:new, :create, :destroy]
    end
    resources :downloads, except: [:show]

  end
end
