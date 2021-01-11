Rails.application.routes.draw do

# 基本ページ
  get '/about' ,to:'static_pages#about'
  root 'static_pages#home'
  get '/signup',to: 'users#new'
  post '/signup',to: 'users#create'

  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'

  get '/courses/:course_id/section_new', to: 'sections#new'
  get '/sections/:section_id/lecture_new', to: 'lectures#new'

  resources :users
  resources :courses,only:[:new,:create,:show,:destroy,:edit,:update,:index]
  resources :sections,only:[:create,:show,:destroy,:edit,:update]
  resources :lectures,only:[:create,:destroy,:edit,:update,:index]

# ログイン機構

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
