Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, expect:[:destroy]
  end
  scope module: :public do
    resources :customers, only:[:show, :edit, :update]
  end
end
