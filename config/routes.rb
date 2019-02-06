Rails.application.routes.draw do
  # 店舗一覧取得
  get "shops" => "shops#index"
  # 店舗詳細取得
  get "shops/:id" => "shops#show"
  # レビュー一覧取得
  get "reviews" => "reviews#index"
  # ホーム画面
  get "/" => "home#top"
  # 紹介ページ
  get "about" => "home#about"
  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
