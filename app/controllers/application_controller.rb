####################
# 基底コントローラー
# @author tanakakota
####################
class ApplicationController < ActionController::Base
  # TODO ExceptionHandlerをConcernに切り分ける
  
  include RenderCommonResponse

  class NoTargetException < ActionController::ActionControllerError; end

  rescue_from Exception, :with => :internal_server_error
  rescue_from ActionController::ParameterMissing, :with => :bad_request_error
  rescue_from ApplicationController::NoTargetException, :with => :no_target_error
  # TODO ParseErrorのハンドリング

  # リクエストの形式が不正
  def bad_request_error
    render_validation_error(Array.new.push("リクエストの形式が間違っています"))
  end

  # 対象が存在しない
  def no_target_error(e=nil)
    render_no_target(e.message)
  end

  # URLが存在しない
  def not_found_error
    render_not_found
  end
  
  # その他の例外
  def internal_server_error(e=nil)
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    render_internal_server_error(e.message)
  end
end
