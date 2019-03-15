####################
# Wi-Fiサービス参照系APIレスポンス生成モジュール
# @author tanakakota
####################
module RenderServicesResponse
  extend ActiveSupport::Concern

  # Wi-Fiサービス一覧取得レスポンス
  def render_service_list(total, services, shop_count_map)
    service_list = Array.new

    # Wi-Fiサービスリストの生成
    services.each do |w|
      service = {
        wifi_id: w.id,
        wifi_name: w.wifi_name,
        link: w.link ||= "",
        shop_count: shop_count_map[w.id]
      }

      service_list.push(service)
    end

    render json: { total: total, wifi_list: service_list }
  end

  # Wi-Fiサービス詳細取得レスポンス
  def render_service_detail(service, shop_count)
    render json: {
      wifi_id: service.id,
      wifi_name: service.wifi_name,
      link: service.link ||= "",
      register_date: service.created_at,
      register_date: service.updated_at,
      shop_count: shop_count
    }
  end
end