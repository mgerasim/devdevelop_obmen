Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  resources :courses
  resources :cryptocurrencies
  get 'welcome/index'
  post 'welcome/index'
  root 'welcome#index'  
    get 'session/new'
    get    '/login',   to: 'session#new'
    post   '/login',   to: 'session#create'
    delete '/logout',  to: 'session#destroy'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
