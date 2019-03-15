####################
# 公開API 店舗コントローラー
# @author tanakakota
####################
class Public::ShopsController < Public::ApplicationController
  include ValidateCondition
  include RenderShopsResponse

  # 店舗一覧取得
  # GET /shops
  def index
    shops = Shop.all
      .limit(validate_limit(params[:limit]))
      .offset(validate_offset(params[:offset]))
      .order(created_at: validate_sort(params[:sort]))

    # 店舗が紐付くWi-Fiサービスの取得
    ids = Array.new
    services = Array.new
    shops.each do |shop|
      next if ids.include?(shop.service_id)
      service = Service.find(shop.service_id)
      services.push(service)
      ids.push(shop.service_id)
    end

    # TODO 各店舗のレビュー数の取得
    # TODO 各店舗の評価の平均値の算出
    # review_map (Hash)にして render_shop_list の引数に加える

    render_shop_list(Shop.count, shops, services)
  end

  # 店舗詳細取得
  # GET /shops:id
  def show
    shop = Shop.find_by(id: params[:id])
    service = Service.find_by(id: shop.service_id)

    # TODO 各店舗のレビュー数の取得
    # TODO 各店舗の評価の平均値の算出
    # review (Array)にして render_shop_list の引数に加える

    render_shop_detail(shop, service)
  end
end
