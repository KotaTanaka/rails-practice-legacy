Rails.application.routes.draw do
  # 店舗一覧取得(API/管理画面)
  get "shops" => "shops#index"
  # 店舗登録(管理画面)
  get "shops/new" => "shops#new"
  # 店舗詳細取得(API/管理画面)
  get "shops/:id" => "shops#show"
  # 店舗登録(API)
  post "shops/create" => "shops#create"
  # 店舗編集(管理画面)
  get "shops/:id/edit" => "shops#edit"
  # 店舗編集(API)
  post "shops/:id/update" => "shops#update"
  # 店舗削除(API)
  post "shops/:id/destroy" => "shops#destroy"

  # レビュー一覧取得(API/管理画面)
  get "reviews" => "reviews#index"
  # レビュー投稿(API)
  post "reviews/create" => "reviews#create"
  # レビューステータス変更(API)
  post "reviews/:id/update" => "reviews#update"
  # レビュー削除(API)
  post "reviews/:id/destroy" => "reviews#destroy"

  # 管理画面ホーム
  get "/" => "home#top"
  # 紹介ページ(後で削除)
  get "about" => "home#about"

  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
