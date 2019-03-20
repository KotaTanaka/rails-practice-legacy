####################
# 店舗参照系APIレスポンス生成モジュール
# @author tanakakota
####################
module RenderShopsResponse
  extend ActiveSupport::Concern

  # 店舗一覧取得レスポンス
  def render_shop_list(total, shops, services, aggregate_review_map)
    shop_list = Array.new

    # 店舗リストの生成
    shops.each do |s|
      wifi_name = ""

      # Wi-Fiサービス名の取得
      services.each do |w|
        if w[:id] == s.service_id
          wifi_name = w[:wifi_name]
          break
        end
      end

      shop = {
        shop_id: s.id,
        wifi_name: wifi_name,
        shop_name: s.shop_name,
        ssid: s.ssid,
        address: s.address,
        access: s.access ||= "",
        shop_type: s.shop_type ||= "",
        opening_hours: s.opening_hours ||= "",
        seats_num: s.seats_num ||= "",
        power: s.power ||= "",
        description: s.description ||= "",
        review_count: aggregate_review_map[s.id][:review_count],
        average: aggregate_review_map[s.id][:evaluation_average] ||= 0
      }

      shop_list.push(shop)
    end

    render json: { total: total, shop_list: shop_list }
  end

  # 店舗詳細取得レスポンス
  def render_shop_detail(shop, service, aggregate_review)
    render json: {
      shop_id: shop.id,
      wifi_id: service.id,
      wifi_name: service.wifi_name,
      link: service.link ||= "",
      shop_name: shop.shop_name,
      ssid: shop.ssid,
      address: shop.address,
      access: shop.access ||= "",
      shop_type: shop.shop_type ||= "",
      opening_hours: shop.opening_hours ||= "",
      seats_num: shop.seats_num ||= "",
      power: shop.power ||= "",
      description: shop.description ||= "",
      register_date: shop.created_at,
      update_date: shop.updated_at,
      review_count: aggregate_review[:review_count],
      average: aggregate_review[:evaluation_average]
    }
  end
end