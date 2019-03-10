Rails.application.routes.draw do
  ####################
  # 公開API
  ####################
  scope module: :public, defaults: { format: "json" } do
    # Shop
    resources :shops, only: [
      # [PS-1] GET /shops 店舗一覧取得
      :index,
      # [PS-2] GET /shops/:id 店舗詳細取得
      :show
    ]

    # Review
    resources :reviews, only: [
      # [PR-1] GET /reviews レビュー一覧取得
      :index,
      # [PR-2] POST /reviews レビュー投稿
      :create
    ]
  end

  ####################
  # 管理API
  ####################
  namespace :admin do
    # Service
    resources :services, only: [
      # [AW-1] GET /admin/services Wi-Fiサービス一覧取得
      :index,
      # [AW-2] GET /admin/services/:id Wi-Fiサービス詳細取得
      :show,
      # [AW-3] POST /admin/services Wi-Fiサービス登録
      :create,
      # [AW-4] PUT /admin/services/:id Wi-Fiサービス編集
      :update,
      # [AW-5] DELETE /admin/services/:id Wi-Fiサービス削除
      :destroy,
      # [管理画面] GET /admin/services/new Wi-Fiサービス登録フォーム
      :new,
      # [管理画面] GET /admin/services/:id/edit Wi-Fiサービス編集フォーム
      :edit
    ]

    # Shop
    resources :shops, only: [
      # [AS-1] GET /admin/shops 店舗一覧取得
      :index,
      # [AS-2] GET /admin/shops/:id 店舗詳細取得
      :show,
      # [AS-3] POST /admin/shops 店舗登録
      :create,
      # [AS-4] PUT /admin/shops/:id 店舗編集
      :update,
      # [AS-5] DELETE /admin/shops/:id 店舗削除
      :destroy,
      # [管理画面] GET /admin/shops/new 店舗登録フォーム
      :new,
      # [管理画面] GET /admin/shops/:id/edit 店舗編集フォーム
      :edit
    ]

    # Review
    resources :reviews, only: [
      # [AR-1] GET /admin/reviews レビュー一覧取得
      :index,
      # [AR-2] PUT /admin/reviews/:id レビューステータス変更
      :update,
      # [AR-3] DELETE /admin/reviews/:id レビュー削除
      :destroy
    ]

    # 管理画面ホーム
    get "/" => "top#index"
  end
end
