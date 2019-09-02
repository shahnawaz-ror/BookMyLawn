Rails.application.routes.draw do
  resources :galleries
  get 'welcome/index'
  get 'welcome/about_us'
  get 'welcome/contact_us'
  get 'welcome/gallery'
  # resources :subdomains
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'welcome#index'
  # match '/', to: 'subdomains#index', constraints: { subdomain: 'your-custom-domain-name' }, via: [:get, :post, :put, :patch, :delete]
  # constraints(SubdomainRoutes) do
  #   resources :subdomains
  #   root 'welcome#index'
  # end
  
  # constraints(!SubdomainRoutes) do
  #   resources :subdomains do
  #     resources :posts
  #   end
  #   root 'subdomains#show'
  # end
  # match '/', to: 'subdomains#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
