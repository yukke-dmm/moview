Rails.application.routes.draw do


  namespace :admin do
    resources :users

    get    '/login',   to: 'session#new'
    post   '/login',   to: 'session#create'
    delete '/logout',  to: 'session#destroy'

    get '/signup',to: 'users#new'
    post '/signup',to: 'users#create'


    get '/courses/:course_id/section_new', to: 'sections#new'
    # get '/courses/:course_id/sections/:section_id/edit' , to: 'sections#edit' ,as: "sec_edit"

    get '/sections/:section_id/lecture_new', to: 'lectures#new', as: "lec_new"
    get '/sections/:section_id/lectures/:lecture_id', to: 'sections#show' ,as: "lec"

    resources :courses,only:[:new,:create,:show,:destroy,:edit,:update,:index]
    resources :sections,only:[:create,:show,:destroy,:update,:edit]
    resources :lectures,only:[:create,:destroy,:edit,:update,:index]
  end



# 基本ページ


  get '/about' ,to:'static_pages#about'
  root 'static_pages#home'

  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'

  get '/courses/:course_id/section_new', to: 'sections#new'
  get '/sections/:section_id/lecture_new', to: 'lectures#new'
  get '/sections/:section_id/lectures/:lecture_id', to: 'sections#show' ,as: "lec"

  # resources :users
  resources :courses,only:[:show,:index]
  resources :sections,only:[:show]
  resources :lectures,only:[:create,:destroy,:edit,:update,:index] do
    resource :is_completed_lectures,only:[:create,:destroy]
  end

# ログイン機構

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
