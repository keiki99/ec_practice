Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {  #管理者用のdeviseルーティング 今回は新規登録機能・パスワード変更機能は不要
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {  #顧客用のdeviseルーティング 今回はパスワード変更機能は不要
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # for details on the dsl available within this file, see https://guides.rubyonrails.org/routing.html
end
