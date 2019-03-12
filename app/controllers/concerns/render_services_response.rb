####################
# Wi-Fiサービス参照系APIレスポンス生成モジュール
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
        link: w.link ||= "",
        shop_count: shop_count_map[w.id]
      }

      service_list.push(service)
    end

    render json: { total: total, wifi_list: service_list }
  end
end