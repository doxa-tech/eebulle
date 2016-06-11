Rails.application.routes.draw do
  get 'errors/not_found'

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_server_error"

  root to: 'pages#home'

  get "/subscribers/unsubscribe/:signature", to: "newsletter_emails#unsubscribe", as: "unsubscribe"
  get "/subscribers/confirmation/:signature", to: "newsletter_emails#confirmation", as: "confirmation"

  %w[home presentation contact kidsbulle vision financement a agenda profile logins].each do |page|
    get page, to: "pages##{page}"
  end

  get '/medias', to: "galleries#index"
  match '/messages', to: "messages#index", via: [:get, :post]

  resources :events, only: [:index]
  resources :activities, only: [:index]
  resources :newsletter_emails, only: [:new, :create]
  resources :galleries, only: [:show]
  resources :downloads, only: [:index]
  resources :newsletters, only: [:show]

  namespace :admin do

    %w[leaders worship].each do |page|
      match page, to: "statics##{page}", via: [:get, :post]
    end

    resources :pages, only: [:index, :edit, :update]
    resources :events, except: [:show]
    resources :activities, except: [:show]
    resources :messages, except: [:show]
    resources :newsletters, only: [:index, :new, :create]
    resources :newsletter_emails, except: [:show]
    resources :galleries, except: [:show] do
      resources :paintings, only: [:new, :create, :destroy]
    end
    resources :downloads, except: [:show]

  end
end
