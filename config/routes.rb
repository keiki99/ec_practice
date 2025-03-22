Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {  #管理者用のdeviseルーティング 今回は新規登録機能・パスワード変更機能は不要
    sessions: "admin/sessions"
  }

  get '/admin' => 'admin/homes#top' #管理者用トップページをget

  namespace :admin do #-----------------------------------------------以下 管理者用コントローラ・アクションの記述------------------------
    resources :genres, only: [:index, :create]

  end

#===================================================================================================================================================

  devise_for :customers, skip: [:passwords], controllers: {  #顧客用のdeviseルーティング 今回はパスワード変更機能は不要
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do #-----------------------------------------------以下 顧客用コントローラ・アクションの記述------------------------
    root to: "homes#top" #サイトを開いて最初に表示されるトップページをget
    get 'homes/about' => 'homes#about', as:'about' #アバウトページをget

    get 'customers/my_page' => 'customers#show' #マイページを表示
    get 'customers/information/edit' => 'customers#edit' #マイページの編集画面を表示
    get 'customers/unsubscribe' => 'customers#unsubscribe' #退会確認画面を表示
    patch 'customers/withdraw' => 'customers#withdraw' #退会処理
  end

  # for details on the dsl available within this file, see https://guides.rubyonrails.org/routing.html
end
