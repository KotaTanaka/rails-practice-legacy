Rails.application.routes.draw do
  # [S-1] 店舗一覧取得
  get "shops" => "shops#index"
  # 管理画面 店舗登録フォーム
  get "shops/new" => "shops#new"
  # [S-3] 店舗登録
  post "shops" => "shops#create"
  # [S-2] 店舗詳細取得
  get "shops/:id" => "shops#show"
  # 管理画面 店舗編集フォーム
  get "shops/:id/edit" => "shops#edit"
  # [S-4] 店舗編集
  put "shops/:id" => "shops#update"
  # [S-5] 店舗削除
  delete "shops/:id" => "shops#destroy"

  # [R-1] レビュー一覧取得
  get "reviews" => "reviews#index"
  # [R-2] レビュー投稿
  post "reviews" => "reviews#create"
  # [R-3] レビューステータス変更
  put "reviews/:id" => "reviews#update"
  # [R-4] レビュー削除
  delete "reviews/:id" => "reviews#destroy"

  # 管理画面 ホーム
  get "/" => "home#top"
  # 紹介ページ(後で削除)
  get "about" => "home#about"

  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
