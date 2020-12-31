Rails.application.routes.draw do

# 基本ページ
  get 'static_pages/home'
  get 'static_pages/about'
  root 'static_pages#home'

# ログイン機構
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
