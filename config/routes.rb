Rails.application.routes.draw do


# 基本ページ
  get '/about' ,to:'static_pages#about'
  root 'static_pages#home'
  get '/signup',to: 'users#new'
  post '/signup',to: 'users#create'

  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'

  resources :users


# ログイン機構

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
