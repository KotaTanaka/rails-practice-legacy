####################
# 管理画面描画コントローラー
####################
class Admin::TopController < Admin::ApplicationController
  # 管理画面トップ
  # GET /admin
  def index
    render("top/index")
  end
end
