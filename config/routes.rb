Rails.application.routes.draw do
  #管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #管理者側namespaceのルーティング

    root to: 'homes#top'
    get 'about' => 'homes#about'

  #顧客用 URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #顧客側namespaceを含めないルーティング
  scope module: :public do
    get '/users/mypage' => 'users#mypage', as: "mypage"
    get '/users/information/edit' => 'users#edit', as: "edit_information"
    patch '/users/information' => 'users#update'
    get '/users/unsubscribe' => 'users#unsubscribe'
    patch '/users/withdraw' => 'users#withdraw'
    get '/searches' => 'searches#search'
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show]
    resource :favotires, only: [:index]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end