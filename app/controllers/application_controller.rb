####################
# 基底コントローラー
####################
class ApplicationController < ActionController::Base
  include RenderCommonResponse

  # その他の例外
  rescue_from Exception, :with => :internal_server_error

  def not_found_error
    render_not_found
  end
  
  def internal_server_error e=nil
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    render_internal_server_error(e.message)
  end
end
