Eebulle::Application.routes.draw do

  root to: 'pages#home'

  %w[home presentation contact].each do |page|
    get page, to: "pages##{page}"
  end

  namespace :admin do

  	resources :pages, only: [:index, :edit, :update]

  end
end
