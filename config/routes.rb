Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    get 'homes/top' => 'homes#top'  #既に管理者側として適用されている
  end
  scope module: :public do
  resources :customers, only:[:show, :edit, :update]
  end
end
