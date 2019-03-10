####################
# エラーレスポンス生成モジュール
####################
module RenderJsonResponse
  extend ActiveSupport::Concern

  # 200 Success
  def render_success(class_name, action_name, id)
    case class_name
      when :service then
        message_class = "Wi-Fiサービス"
      when :shop then
        message_class = "店舗"
      when :review then
        message_class = "レビュー"
      else
        message_class = ""
    end

    case action_name
      when :create then
        message_action = "登録"
      when :update then
        message_action = "更新"
      when :delete then
        message_action = "削除"
      else
        message_action = ""
    end

    render status: 200, json: {
      code: 200,
      message: "#{message_class}の#{message_action}に成功しました。",
      id: id
    }
  end
  
  # 400 Bad Request
  def render_bad_request
    render status: 400, json: { code: 400, message: "パラメータが不正です。" }
  end
  
  # 403 Forbidden
  def render_forbidden
    render status: 403, json: { code: 403, message: "認証に失敗しました。" }
  end
  
  # 404 Not Found
  def render_not_found
    render status: 404, json: { code: 404, message: "存在しないURLです。" }
  end
  
  # 500 Internal Server Error
  def render_internal_server_error(error_message)
    render status: 500, json: {
      code: 500,
      message: "システムエラーが発生しました。",
      detail_message: error_message
    }
  end
end