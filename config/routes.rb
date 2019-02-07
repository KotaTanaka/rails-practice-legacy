Rails.application.routes.draw do
  # 店舗一覧取得
  get "shops" => "shops#index"
  # 店舗詳細取得
  get "shops/:id" => "shops#show"
  # レビュー一覧取得
  get "reviews" => "reviews#index"
  # レビュー投稿画面
  get "reviews/new" => "reviews#new"
  # レビュー投稿
  post "reviews/create" => "reviews#create"
  # ホーム画面
  get "/" => "home#top"
  # 紹介ページ
  get "about" => "home#about"
  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
