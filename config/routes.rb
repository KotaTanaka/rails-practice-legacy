Rails.application.routes.draw do
  # Shop API フルルーティング
  # - [S-1] GET /shops 店舗一覧取得
  # - [S-2] GET /shops/:shop_id 店舗詳細取得
  # - [S-3] POST /shops 店舗登録
  # - [S-4] PUT /shops/:shop_id 店舗編集
  # - [S-5] DELETE /shops/:shop_id 店舗削除
  # - [管理画面] GET /shops/new 店舗登録フォーム
  # - [管理画面] GET /shops/:shop_id/edit 店舗編集フォーム
  resources :shops

  # Review API
  resources :reviews, only: [
    # [R-1] GET /reviews レビュー一覧取得
    :index,
    # [R-2] POST /reviews レビュー投稿
    :create,
    # [R-3] PUT /reviews/:review_id レビューステータス変更
    :update,
    # [R-4] DELETE /reviews/:review_id レビュー削除
    :destroy
  ]

  # [管理画面] ホーム
  get "/" => "home#top"
  # [管理画面] 管理画面説明ページ
  get "about" => "home#about"

  # サンプル(使わない)
  resources :spots
end
