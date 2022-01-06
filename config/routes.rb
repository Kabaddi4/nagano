Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, expect:[:destroy]
    resources :orders, only:[:show, :update]
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :customers, only:[:show, :edit, :update]
    get 'unsubscribe/:id' => 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'withdrawal/:id' => 'customers#withdraw'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    get 'complete' => 'orders#complete'
    post 'confirm' => 'orders#confirm'
    delete 'destroy_all' => 'cart_items#destroy_all'

  end
end
