####################
# 店舗参照系APIレスポンス生成モジュール
####################
module RenderShopsResponse
  extend ActiveSupport::Concern

  # 店舗一覧取得レスポンス
  def render_shop_list(total, shops, services)
    shop_list = Array.new

    # 店舗リストの生成
    shops.each do |s|
      wifi_name = String.new

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
        ssid: s.ssid,
        shop_name: s.shop_name,
        address: s.address,
        shop_type: s.shop_type ||= "",
        opening_hours: s.opening_houres ||= "",
        power: s.power ||= "",
        description: s.descriotion ||= "",
        average: "-"
      }

      shop_list.push(shop)
    end

    render json: { total: total, shop_list: shop_list }
  end
end