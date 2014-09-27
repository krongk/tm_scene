Rails.application.routes.draw do

  resources :pictures do 
    collection {get :meitu_load}
    collection {post :meitu_upload}
  end

  resources :galleries

  resources :resources

  #admin
  resources :site_comments
  resources :site_pages  resources :site_sections
  resources :sites do 
    get 'preview'
    get 'themes'
    get 'payment'
    post 'set_theme'
    post 'verify_payment_token'
    post :alipay_notify
  end
  get '/sites/:id/edit_common_section', to: "sites#edit_common_section", as: 'edit_common_section'

  #front page
  get "/s/:site_id", to: "s#index", as: 'app'
  get "/preview/:site_id", to: "s#preview", as: 'preview'
  match '/templates(/page/:page)', to: "home#templates", via: :get, as: 'templates'
  match '/templates/:id', to: "home#template", via: :get, as: 'template'
  match '/case(/page/:page)', to: "home#case", via: :get, as: 'case'
  match '/blog(/page/:page)', to: "home#blog", via: :get, as: 'blog'
  match '/post/:id', to: "home#post", via: :get, as: 'post'
  match '/pricing', to: "home#pricing", via: :get, as: 'pricing'
  root :to => "home#index"

  #login
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: "omniauth_callbacks"}
  resources :users
end
