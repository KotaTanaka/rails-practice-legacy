####################
# 基底コントローラー
# @author tanakakota
####################
class ApplicationController < ActionController::Base
  include RenderCommonResponse

  class NoTargetException < ActionController::ActionControllerError; end

  rescue_from Exception, :with => :internal_server_error
  rescue_from ApplicationController::NoTargetException, :with => :no_target_error

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
