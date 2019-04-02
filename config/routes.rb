Rails.application.routes.draw do
  get 'welcome/index'
  # resources :subdomains
  devise_for :users
  # root 'subdomains#index'
  # match '/', to: 'subdomains#index', constraints: { subdomain: 'your-custom-domain-name' }, via: [:get, :post, :put, :patch, :delete]
  constraints(SubdomainRoutes) do
    resources :subdomains, only: [:new, :show, :create]
    root 'welcome#index'
  end
  
  constraints(!SubdomainRoutes) do
    resources :subdomains, except: [:destroy] do
      resources :posts
    end
    root 'subdomains#show'
  end
  # match '/', to: 'subdomains#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
