Rails.application.routes.draw do
  #管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #管理者側namespaceのルーティング
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :show, :update]
    resources :posts, only: [:index, :destroy]
    resources :tags, only: [:index, :create, :destroy]
  end


  #顧客用 URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #顧客側namespaceを含めないルーティング
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get '/users/mypage' => 'users#mypage', as: "mypage"
    get '/users/information/edit' => 'users#edit', as: "edit_information"
    patch '/users/information' => 'users#update'
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    get '/search' => 'searches#search'
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show] do
      member do
        get :favorites #いいねしたユーザーを判別するためネスト。判別にidが必要なのでmember
      end
    end
  end

  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to:'public/sessions#guest_sign_in'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end